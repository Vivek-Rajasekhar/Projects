/* Includes ------------------------------------------------------------------*/
#include "BB.h"
#include "main.h"

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART1_UART_Init(void);

/* USER CODE BEGIN 0 */
UART_HandleTypeDef huart1;  // UART handle for USART1
Lcd_HandleTypeDef lcd;      // LCD handle
char rx_buffer[64];         // Buffer for received Bluetooth data
volatile uint8_t rx_index = 0;  // Index for received data buffer
volatile uint8_t message_ready = 0;// Flag to indicate if a full message is received


char display_buffer[17];              // For displaying a 16-character segment
uint8_t scroll_position = 1;          // Position for scrolling text
uint32_t last_scroll_time = 0;        // Time marker for scroll timing
uint32_t scroll_interval = 300;       // Delay in milliseconds for scrolling speed

/* USER CODE END 0 */

int main(void)
{
    /* MCU Configuration--------------------------------------------------------*/
    HAL_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_USART1_UART_Init();

    /* USER CODE BEGIN 2 */
    // Define the ports and pins for D4-D7 pins (4-bit mode)
    Lcd_PortType ports[] = { GPIOB, GPIOB, GPIOB, GPIOB };
    Lcd_PinType pins[] = { GPIO_PIN_0, GPIO_PIN_1, GPIO_PIN_2, GPIO_PIN_10 };

    // Initialize the LCD in 4-bit mode with RS on PA1, E on PA3
    lcd = Lcd_create(ports, pins, GPIOA, GPIO_PIN_1, GPIOA, GPIO_PIN_3, LCD_4_BIT_MODE);

    // Initialize and clear the LCD display
    HAL_Delay(50); // Allow time for the LCD to power up
    Lcd_init(&lcd);
    Lcd_clear(&lcd);

    // Display initial message on the LCD
    Lcd_cursor(&lcd, 0, 0);
    Lcd_string(&lcd, "input");

    // Start receiving data via interrupt
    HAL_UART_Receive_IT(&huart1, (uint8_t *)&rx_buffer[rx_index], 1);

    /* USER CODE END 2 */

    /* Infinite loop */
    while (1)
    {
        // If message is ready, parse and display it on the LCD
        if (message_ready)
        {
            // Null-terminate the received message
            rx_buffer[rx_index] = '\0';

            // Process command-based control
            process_command(rx_buffer);

            // Reset flags and index for next message
            rx_index = 0;
            message_ready = 0;
        }
    }
}

/* USART1 init function */
static void MX_USART1_UART_Init(void)
{
    huart1.Instance = USART1;
    huart1.Init.BaudRate = 9600;           // Match this with your Bluetooth module's baud rate
    huart1.Init.WordLength = UART_WORDLENGTH_8B;
    huart1.Init.StopBits = UART_STOPBITS_1;
    huart1.Init.Parity = UART_PARITY_NONE;
    huart1.Init.Mode = UART_MODE_TX_RX;
    huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    huart1.Init.OverSampling = UART_OVERSAMPLING_16;
    if (HAL_UART_Init(&huart1) != HAL_OK)
    {
        Error_Handler();
    }
}

/* Callback function to handle received data */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART1) // Check if the interrupt is for USART1
    {
        // Ignore carriage return '\r' characters
        if (rx_buffer[rx_index] != '\r')
        {
            // If received character is newline '\n', mark message as ready
            if (rx_buffer[rx_index] == '\n' || rx_index >= sizeof(rx_buffer) - 2)
            {
                message_ready = 1;
                 // Set flag to indicate message is ready
            }
            else
            {
                rx_index++; // Move to the next index
            }
        }

        // Start the next reception

        HAL_UART_Receive_IT(&huart1, (uint8_t *)&rx_buffer[rx_index], 1);
    }
}

/* Process command-based control */
void process_command(char *message)
{
    char response[33];  // Buffer for response messages

    // Check for the "CLR" command
    if (strncmp(message, " CLR", 3) == 0)
    {
        Lcd_clear(&lcd);
        Lcd_cursor(&lcd, 0, 0);
        Lcd_string(&lcd, "Screen Cleared");
        HAL_Delay(2000);
        Lcd_clear(&lcd);
    }
    // Check for "LINE1:" or "LINE2:" command
    else if (strncmp(message, " 1 ", 3) == 0)
    {

    	HAL_UART_Transmit(&huart1, (uint8_t *)message+3, strlen(message+3), HAL_MAX_DELAY);
        Lcd_clear(&lcd);
        Lcd_cursor(&lcd, 0, 0);
        Lcd_string(&lcd, message + 3);  // Display after "LINE1:"
    }
    else if (strncmp(message, " 2 ", 3) == 0)
    {	HAL_UART_Transmit(&huart1, (uint8_t *)message+3, strlen(message+3), HAL_MAX_DELAY);
        Lcd_clear(&lcd);
        Lcd_cursor(&lcd, 1, 0);
        Lcd_string(&lcd, message + 3);  // Display after "LINE2:"
    }
    // Check for "SCROLL:" command for scrolling text
    else if (strncmp(message, " S: ", 3) == 0)
    {	HAL_UART_Transmit(&huart1, (uint8_t *)message+4, strlen(message+4), HAL_MAX_DELAY);
    	scroll_text(message+4);

    }
    // Default: Display text on first line if no command prefix


        else
        {
        	char a[33];

        	strncpy(a, message+1, 32);
        	a[32] = '\0';
        	HAL_UART_Transmit(&huart1, (uint8_t *)a, strlen(a), HAL_MAX_DELAY);
            Lcd_clear(&lcd);
            Lcd_cursor(&lcd, 0, 0);
            Lcd_string(&lcd, a);
        }

}

/* Scroll text on the LCD */
void scroll_text(char *text)
{
    int len = strlen(text);
    int count=2*len;

    while(count>=0){
    // Only proceed if enough time has passed for scrolling
    uint32_t current_time = HAL_GetTick();
    if (len > 16 && (current_time - last_scroll_time >= scroll_interval))
    {
        // Update the display buffer with a 16-character window

        strncpy(display_buffer, text + scroll_position, 16);
        display_buffer[16] = '\0';    // Null-terminate for safety

        // Clear the LCD and display the updated window
        Lcd_clear(&lcd);
        Lcd_cursor(&lcd, 0, 0);
        Lcd_string(&lcd, display_buffer);

        // Move scroll position, looping back if at the end
        scroll_position++;
        if (scroll_position > len - 16)
            scroll_position = 0;

        // Update last scroll time
        last_scroll_time = current_time;
        count--;
    }


    else if (len <= 16)  // If message fits in one screen, display without scrolling
    {
        Lcd_clear(&lcd);
        Lcd_cursor(&lcd, 0, 0);
        Lcd_string(&lcd, text);
        scroll_position = 0; // Reset scroll position
    }



}
Lcd_clear(&lcd);
}


/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    /* GPIO Ports Clock Enable */
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();

    /* Configure GPIO pins for RS and E (PA1 and PA3) */
    GPIO_InitStruct.Pin = GPIO_PIN_1 | GPIO_PIN_3;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    /* Configure GPIO pins for D4-D7 (PB0, PB1, PB2, PB10) */
    GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_10;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
    // Clock configuration code here
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
    __disable_irq();
    while (1)
    {
        // Stay in error handler loop
    }
}
