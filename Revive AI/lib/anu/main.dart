import 'package:flutter/material.dart';
import 'login_page.dart';        // Ensure this file exists and is correct
import 'dashboard_page.dart';   // Ensure this file exists and is correct
import 'survey_page.dart';      // Ensure this file exists and is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burnout Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',  // Make sure the font is declared in pubspec.yaml
        textTheme: TextTheme(
           bodyLarge: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/login',  // Starting page is set to LoginPage
      routes: {
        '/login': (context) => LoginPage(),         // Route for LoginPage
        '/dashboard': (context) => DashboardPage(), // Route for DashboardPage
        '/survey': (context) => SurveyPage(),       // Route for SurveyPage
      },
    );
  }
}
