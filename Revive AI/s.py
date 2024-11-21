from flask import Flask, request, jsonify
from flask_cors import CORS  # Import CORS
import pandas as pd
import joblib
from sklearn.preprocessing import OrdinalEncoder
import requests  # To send the request to GoGemini AI

# Load the saved model
model = joblib.load('burnout_model.pkl')

# Initialize the Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Define ordinal mappings
ordinal_mappings = {
    'Stress Level': {'Low': 0, 'Moderate': 1, 'High': 2},
    'Mood Rating': {'Negative': 0, 'Neutral': 1, 'Positive': 2},
    'Sleep Quality': {'Poor': 0, 'Average': 1, 'Good': 2},
    'Energy Level': {'Low': 0, 'Moderate': 1, 'High': 2},
    'Work Hours Per Day': {'Low': 0, 'Normal': 1, 'Extended': 2, 'Overworking': 3},
    'Job Satisfaction': {'Dissatisfied': 0, 'Neutral': 1, 'Very Satisfied': 2},
    'Workload Intensity': {'Low': 0, 'Moderate': 1, 'High': 2},
    'Break Frequency': {'Low Balance': 0, 'Moderately Balanced': 1, 'Balanced': 2},
    'Overtime Frequency': {'None': 0, 'Occasional': 1, 'Frequent': 2, 'Constant': 3},
    'Role Clarity': {'Unclear': 0, 'Somewhat Clear': 1, 'Very Clear': 2},
    'Autonomy in Work': {'Low': 0, 'Moderate': 1, 'High': 2},
}

@app.route('/predict', methods=['POST'])
def predict_burnout():
    data = request.json  # Get the JSON data
    input_data = pd.DataFrame([data])  # Convert to DataFrame for model

    # Encode using ordinal mapping
    for column in input_data.columns:
        if column in ordinal_mappings:
            input_data[column] = input_data[column].map(ordinal_mappings[column])

    # Check for NaN values after mapping (if any value was not found)
    if input_data.isnull().values.any():
        return jsonify({'error': 'Invalid data provided'}), 400

    # Predict using the model
    prediction = model.predict(input_data)

    # Print the prediction to the server console
    print(f"Prediction: {prediction[0]}")

    # Respond with the prediction
    response = {'burnout_risk': int(prediction[0])}  # Convert to int for JSON response
    return jsonify(response)


# # Define a new route for sending a "get well" message query to GoGemini AI
# @app.route('/get_well_message', methods=['POST'])
# def get_well_message():
#     prompt = "Please generate a kind 'get well' message."
    
#     # API details
#     gemini_api_url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent'
#     api_key = 'AIzaSyDv0sxfwU4VvX8hqTwVD70lEGTyBqR-4Gk'  # Replace with your actual API key
#     headers = {
#         'Content-Type': 'application/json'
#     }
#     payload = {
#         "contents": [
#             {
#                 "parts": [
#                     {
#                         "text": prompt
#                     }
#                 ]
#             }
#         ]
#     }

#     try:
#         # Send the request to GoGemini API
#         response = requests.post(f'{gemini_api_url}?key={api_key}', json=payload, headers=headers)
#         response.raise_for_status()  # Raise an error for bad responses

#         # Debugging: Print the full response content
#         print(f"Response Status Code: {response.status_code}")
#         print(f"Response Content: {response.content}")

#         # Extract the message from the response
#         message = response.json().get('contents', [{'parts': [{'text': 'Sorry, I couldn’t generate a message.'}]}])[0]['parts'][0]['text']

#         return jsonify({'get_well_message': message})

#     except requests.exceptions.RequestException as e:
#         # Handle API errors and log more information for debugging
#         print(f"API Request failed: {str(e)}")
#         return jsonify({'error': f'Failed to get message from GoGemini AI: {str(e)}', 'details': response.content.decode('utf-8')}), 500


@app.route('/get_well_message', methods=['POST'])
def get_well_message():
    prompt = "Please generate a kind 'get well' message."
    
    # API details
    gemini_api_url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent'
    api_key = 'AIzaSyDv0sxfwU4VvX8hqTwVD70lEGTyBqR-4Gk'  # Replace with your actual API key
    headers = {
        'Content-Type': 'application/json'
    }
    payload = {
        "contents": [
            {
                "parts": [
                    {
                        "text": prompt
                    }
                ]
            }
        ]
    }

    try:
        # Send the request to GoGemini API
        response = requests.post(f'{gemini_api_url}?key={api_key}', json=payload, headers=headers)
        response.raise_for_status()  # Raise an error for bad responses

        # Debugging: Print the full response content
        print(f"Response Status Code: {response.status_code}")
        print(f"Response Content: {response.content}")

        # Extract the message from the response
        message = response.json().get('candidates', [{'content': {'parts': [{'text': 'Sorry, I couldn’t generate a message.'}]}}])[0]['content']['parts'][0]['text']

        return jsonify({'get_well_message': message})

    except requests.exceptions.RequestException as e:
        # Handle API errors and log more information for debugging
        print(f"API Request failed: {str(e)}")
        return jsonify({'error': f'Failed to get message from GoGemini AI: {str(e)}'}), 500

# Run the Flask server
if __name__ == '__main__':
    app.run(host='localhost', port=5001, debug=True)  # Listen on all interfaces
