// import 'package:flutter/material.dart';
// import 'package:travelling_buddy/Homepage.dart';
// // import 'package:travelling_buddy/api.dart';
// import 'package:travelling_buddy/firebase_options.dart';
// import 'package:travelling_buddy/login.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// // import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:travelling_buddy/signup.dart';

// const String Apikey = "AIzaSyDFNe2S3sMvUR1nVnP2NebCBdG62tiDDco";
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Gemini.init(apiKey: Apikey);
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(TravellingBuddyApp());
// }

// class TravellingBuddyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Travelling Buddy',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:travelling_buddy/Homepage.dart'; // Homepage screen
import 'package:travelling_buddy/firebase_options.dart'; // Firebase config
import 'package:travelling_buddy/login.dart'; // Login page
import 'package:flutter_gemini/flutter_gemini.dart'; // Gemini AI integration
import 'package:firebase_core/firebase_core.dart'; // Firebase core package

const String Apikey = "AIzaSyDFNe2S3sMvUR1nVnP2NebCBdG62tiDDco";

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures widget binding is initialized
  runApp(TravellingBuddyApp());
}

class TravellingBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: 'Travelling Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Theme color
      ),
      home: SplashScreen(), // Set the splash screen as the initial home
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Initialize Firebase and Gemini API
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      Gemini.init(apiKey: Apikey);

      // Simulate a delay (optional, for UX)
      await Future.delayed(Duration(seconds: 2));

      // Navigate to the login page after initialization
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print("Error during initialization: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF1c1c1c),
      body: Center(
        child: _isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.jpg', // Path to your logo
                    fit: BoxFit.cover, // Adjust the size of the logo as needed
                  ),
                  // CircularProgressIndicator(), // Loading spinner
                  // SizedBox(height: 20),
                  // Text('Initializing...', style: TextStyle(fontSize: 16)),
                ],
              )
            : LoginPage(),
        // This will be replaced when loading is complete
      ),
    );
  }
}
