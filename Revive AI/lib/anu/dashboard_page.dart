import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'survey_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String burnoutStatus = 'No Burnout'; // Initial burnout status
  TextEditingController _messageController = TextEditingController(); // Controller for the text box
  String getWellMessage = ''; // To store the AI response

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade900, Colors.purpleAccent.shade200],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, [User Name]',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Burnout Status: $burnoutStatus',
                style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Colors.purpleAccent.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black38,
                ),
                onPressed: () async {
                  // Navigate to Survey page
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurveyPage()),
                  );

                  if (result != null && result is String) {
                    setState(() {
                      burnoutStatus = result; // Update burnout status
                    });
                  }
                },
                child: Text(
                  'Take Survey',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Text box for entering a message to query AI
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    labelText: 'Enter your message for AI',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Button to send message to AI
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  final message = _messageController.text;
                  if (message.isNotEmpty) {
                    String aiResponse = await queryGeminiAI(message);
                    setState(() {
                      getWellMessage = aiResponse; // Update with AI response
                    });
                  }
                },
                child: Text(
                  'Send to Gemini AI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Display the AI response
              Text(
                getWellMessage,
                style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Montserrat'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to send message to the server for Gemini AI query
Future<String> queryGeminiAI(String message) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:5001/get_well_message'),  // Replace with actual server URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      // Print the raw response body for inspection
      print('Raw response: ${response.body}');
      
      // Try parsing it as JSON
      final data = jsonDecode(response.body);

      // Check if the response contains 'get_well_message'
      if (data != null && data['get_well_message'] != null) {
        return data['get_well_message']; // Return the AI message
      }
      return 'No message received from AI.';
    } else {
      return 'Failed to get response from AI.';
    }
  } catch (e) {
    print('Error: $e');
    return 'Error: $e';
  }
}




}
