// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:travelling_buddy/Homepage.dart';
// import 'package:travelling_buddy/forgotpassword.dart';
// import 'package:travelling_buddy/privacyandpolicypage.dart';
// import 'package:travelling_buddy/signup.dart';
// import 'package:travelling_buddy/teamsand%20condition.dart';

// class LoginPage extends StatelessWidget {
//   TextEditingController usernamecontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset(
//               'assets/logo.jpg',
//               height: 40,
//             ),
//             Text(
//               'Login',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(width: 40),
//           ],
//         ),
//       ),
//        backgroundColor: Color(0xFF1A1D24),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage("assets/p-2.png.avif"),fit: BoxFit.cover,)

//         ),
//         child: SingleChildScrollView(

//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Greeting the user
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Welcome Back!',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 10),
//                       // Slogan
//                       Text(
//                         'Discover new horizons together', // Slogan
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 16,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // Input fields container with theme styles
//                 Container(
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF23272F), // Dark background for inputs
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       // Email input field
//                       TextField(
//                         controller: usernamecontroller,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your email',
//                           hintStyle: TextStyle(color: Colors.white54),
//                           filled: true,
//                           fillColor: Color(0xFF2C3038), // Input background color
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           prefixIcon: Icon(Icons.person, color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white), // Input text color
//                       ),
//                       SizedBox(height: 20),
//                       // Password input field
//                       TextField(
//                         controller: passwordcontroller,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your password',
//                           hintStyle: TextStyle(color: Colors.white54),
//                           filled: true,
//                           fillColor: Color(0xFF2C3038),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           prefixIcon: Icon(Icons.lock, color: Colors.white),
//                         ),
//                         obscureText: true,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(height: 20),
//                       // Login button styled similar to home page's "Plan My Trip" button
//                       ElevatedButton(
//                         onPressed: () async {
//                           try {
//                             UserCredential userCredential = await FirebaseAuth
//                                 .instance
//                                 .signInWithEmailAndPassword(
//                               email: usernamecontroller.text.trim(),
//                               password: passwordcontroller.text.trim(),
//                             );
//                             // Navigate to homepage on success
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text('Login successful!')),
//                             );
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return HomePage();
//                             }));
//                           } on FirebaseAuthException catch (e) {
//                             String errorMessage;
//                             if (e.code == 'user-not-found') {
//                               errorMessage = 'No user found for that email.';
//                             } else if (e.code == 'wrong-password') {
//                               errorMessage = 'Wrong password provided.';
//                             } else {
//                               errorMessage =
//                                   'Something went wrong. Please try again.';
//                             }
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text(errorMessage)),
//                             );
//                           }
//                         },
//                         child: Text(
//                           'Login',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           padding:
//                               EdgeInsets.symmetric(vertical: 15, horizontal: 50),
//                           backgroundColor:
//                               Color(0xFF4CAF50), // Same as home page button
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       // Forgot password and Sign up buttons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return ForgotPasswordPage();
//                               }));
//                             },
//                             child: Text('Forgot Password?'),
//                             style: TextButton.styleFrom(
//                                 foregroundColor: Colors.white),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return SignupPage();
//                               }));
//                             },
//                             child: Text('Sign up'),
//                             style: TextButton.styleFrom(
//                                 foregroundColor: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Footer with links
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         '© 2024 Travelling Buddy',
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => PrivacyPolicyPage(),
//                                   ));
//                             },
//                             child: Text('Privacy Policy'),
//                             style: TextButton.styleFrom(
//                                 foregroundColor: Colors.white),
//                           ),
//                           SizedBox(width: 10),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         TermsAndConditionsPage(),
//                                   ));
//                             },
//                             child: Text('Terms of Service'),
//                             style: TextButton.styleFrom(
//                                 foregroundColor: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelling_buddy/Homepage.dart';
import 'package:travelling_buddy/forgotpassword.dart';
import 'package:travelling_buddy/privacyandpolicypage.dart';
import 'package:travelling_buddy/signup.dart';
// import 'package:travelling_buddy/teamsandcondition.dart';

import 'home.dart';
import 'teamsand condition.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF1A1D24),
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
            // image: AssetImage("assets/p-2.png"),
          //  fit: BoxFit.cover,
          // ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Greeting the user
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Slogan
                      Text(
                        'Discover new horizons together',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Input fields container with theme styles
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color:
                        const Color(0xFF23272F), // Dark background for inputs
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Email input field
                      TextField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor:
                              const Color(0xFF2C3038), // Input background color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      // Password input field
                      TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: const Color(0xFF2C3038),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      // Login button styled similar to home page's "Plan My Trip" button
                      ElevatedButton(
                        onPressed: () async {
                          // Basic validation
                          if (usernamecontroller.text.isEmpty ||
                              passwordcontroller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill in all fields.')),
                            );
                            return;
                          }

                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                              email: usernamecontroller.text.trim(),
                              password: passwordcontroller.text.trim(),
                            );
                            // Navigate to homepage on success
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Login successful!')),
                            );
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return home();
                            }));
                          } on FirebaseAuthException catch (e) {
                            String errorMessage;
                            switch (e.code) {
                              case 'user-not-found':
                                errorMessage = 'No user found for that email.';
                                break;
                              case 'wrong-password':
                                errorMessage = 'Wrong password provided.';
                                break;
                              default:
                                errorMessage =
                                    'Something went wrong. Please try again.';
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          backgroundColor: const Color(
                              0xFF4CAF50), // Same as home page button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Forgot password and Sign up buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ForgotPasswordPage();
                              }));
                            },
                            child: const Text('Forgot Password?'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignupPage();
                              }));
                            },
                            child: const Text('Sign up'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Footer with links
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '© 2024 Travelling Buddy',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PrivacyPolicyPage(),
                                ),
                              );
                            },
                            child: const Text('Privacy Policy'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TermsAndConditionsPage(),
                                ),
                              );
                            },
                            child: const Text('Terms of Service'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
