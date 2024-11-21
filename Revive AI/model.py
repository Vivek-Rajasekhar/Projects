import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import joblib  # For saving and loading the model

# Load the dataset and prepare the model (as you did before)
df = pd.read_csv('encoded_data_5000.csv')
df.drop('Unnamed: 0', axis=1, inplace=True)

X = df.drop('Burnout Risk', axis=1)
y = df['Burnout Risk']

# Split the data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.8)

# Train the model
regg = LogisticRegression()
regg.fit(X_train, y_train)

# Save the trained model using joblib
joblib.dump(regg, 'burnout_model.pkl')

print("Model has been trained and saved as 'burnout_model.pkl'")
