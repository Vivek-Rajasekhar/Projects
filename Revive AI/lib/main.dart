import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // Import Firebase
import './anu/login_page.dart';       
import './anu/dashboard_page.dart';   
import './anu/survey_page.dart';      
import 'firebase_options.dart';       // Import Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(          // Initialize Firebase
    options: DefaultFirebaseOptions.currentPlatform, // Using platform-specific options
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burnout Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
           bodyLarge: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/survey': (context) => SurveyPage(),
      },
    );
  }
}
