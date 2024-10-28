
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:travelling_buddy/Homepage.dart';
// import 'package:travelling_buddy/home.dart';
// import 'package:travelling_buddy/login.dart';
// import 'package:travelling_buddy/teamsand%20condition.dart';

// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool _agreedToTOS = false;
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickProfileImage() async {
//     final pickedImage = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedImage != null) {
//       setState(() {
//         _profileImage = File(pickedImage.path);
//       });
//     }
//   }

//   Future<void> _signup() async {
//     if (_formKey.currentState!.validate() && _agreedToTOS) {
//       try {
//         // Create user with Firebase Auth
//         UserCredential userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );

//         String? profileImageUrl;
//         // Upload profile image to Firebase Storage if selected
//         if (_profileImage != null) {
//           final storageRef = FirebaseStorage.instance
//               .ref()
//               .child('profile_images')
//               .child(userCredential.user!.uid + '.jpg');
//           await storageRef.putFile(_profileImage!);
//           profileImageUrl = await storageRef.getDownloadURL();
//         }

//         // Store user details in Firestore
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .set({
//           'firstName': _firstNameController.text.trim(),
//           'lastName': _lastNameController.text.trim(),
//           'email': _emailController.text.trim(),
//           'profileImageUrl': profileImageUrl ?? '',
//           'createdAt': FieldValue.serverTimestamp(), // Add timestamp
//           'isActive': true, // Example field to mark user as active
//         });

//         // Show success message
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Signup successful!')));
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => home()));
//       } catch (e) {
//         print("Error during signup: $e");
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Signup failed: ${e.toString()}')));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content:
//               Text('Please fill the form and agree to Terms and Conditions')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF1A1D24),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset('assets/logo.jpg', height: 40),
//             Text(
//               'Create your account',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(width: 40),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Headline
//               Text(
//                 "Discover the Horizons Together",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 10), // Spacing between headline and subheading
//               // Subheading
//               Text(
//                 "Sign up for Travelling Buddy and find your perfect travel companion",
//                 style: TextStyle(
//                     color: Colors.white54,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20), // Spacing before the form
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF23272F), // Dark background for inputs
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       // Profile image picker
//                       GestureDetector(
//                         onTap: _pickProfileImage,
//                         child: CircleAvatar(
//                           radius: 50,
//                           backgroundImage: _profileImage != null
//                               ? FileImage(_profileImage!)
//                               : null,
//                           child: _profileImage == null
//                               ? Icon(Icons.add_a_photo,
//                                   size: 50, color: Colors.white)
//                               : null,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       // First name input field
//                       TextFormField(
//                         controller: _firstNameController,
//                         decoration: InputDecoration(
//                           hintText: 'First Name',
//                           hintStyle: TextStyle(color: Colors.white54),
//                           filled: true,
//                           fillColor:
//                               Color(0xFF2C3038), // Input background color
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           prefixIcon: Icon(Icons.person, color: Colors.white),
//                         ),
//                         style:
//                             TextStyle(color: Colors.white), // Input text color
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your first name';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       // Last name input field
//                       TextFormField(
//                         controller: _lastNameController,
//                         decoration: InputDecoration(
//                           hintText: 'Last Name',
//                           hintStyle: TextStyle(color: Colors.white54),
//                           filled: true,
//                           fillColor: Color(0xFF2C3038),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           prefixIcon: Icon(Icons.person, color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your last name';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       // Email input field
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your email',
//                           hintStyle: TextStyle(color: Colors.white54),
//                           filled: true,
//                           fillColor: Color(0xFF2C3038),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           prefixIcon: Icon(Icons.email, color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       // Password input field
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           hintText: 'Password',
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
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 8) {
//                             return 'Password must be at least 8 characters';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       // Confirm password input field
//                       TextFormField(
//                         controller: _confirmPasswordController,
//                         decoration: InputDecoration(
//                           hintText: 'Confirm Password',
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
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please confirm your password';
//                           }
//                           if (value != _passwordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       // Terms and conditions checkbox
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _agreedToTOS,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 _agreedToTOS = value ?? false;
//                               });
//                             },
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           TermsAndConditionsPage()));
//                             },
//                             child: Text(
//                               'I agree to the Terms and Conditions',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       // Signup button
//                       ElevatedButton(
//                         onPressed: _signup,
//                         child: Text('Sign Up'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF4CAF50),
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       SizedBox(height: 20), // Spacing at the bottom
//                       // Switch to login page link
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return LoginPage();
//                           })); // Navigate back to login page
//                         },
//                         child: Text(
//                           'Already have an account? Login here',
//                           style: TextStyle(color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelling_buddy/login.dart';
import 'package:travelling_buddy/teamsand%20condition.dart';
// import 'package:travelling_buddy/termsandconditions.dart';
import 'package:travelling_buddy/home.dart'; // Make sure the home page is imported

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate() && _agreedToTOS) {
      try {
        // Create user with Firebase Auth
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        String? profileImageUrl;
        // Upload profile image to Firebase Storage if selected
        if (_profileImage != null) {
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('profile_images')
              .child(userCredential.user!.uid + '.jpg');
          await storageRef.putFile(_profileImage!);
          profileImageUrl = await storageRef.getDownloadURL();
        }

        // Store user details in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'email': _emailController.text.trim(),
          'profileImageUrl': profileImageUrl ?? '',
          'createdAt': FieldValue.serverTimestamp(), // Add timestamp
          'isActive': true, // Example field to mark user as active
        });

        // Navigate to home page and pass the user ID
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => home(userId: userCredential.user!.uid)),
        );
      } catch (e) {
        print("Error during signup: $e");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signup failed: ${e.toString()}')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Please fill the form and agree to Terms and Conditions')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/logo.jpg', height: 40),
            Text(
              'Create your account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 40),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Headline
              Text(
                "Discover the Horizons Together",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Subheading
              Text(
                "Sign up for Travelling Buddy and find your perfect travel companion",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFF23272F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Profile image picker
                      GestureDetector(
                        onTap: _pickProfileImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                          child: _profileImage == null
                              ? Icon(Icons.add_a_photo,
                                  size: 50, color: Colors.white)
                              : null,
                        ),
                      ),
                      SizedBox(height: 20),
                      // First name input field
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF2C3038),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Last name input field
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF2C3038),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Email input field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF2C3038),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Password input field
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF2C3038),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Confirm password input field
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF2C3038),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Terms and conditions checkbox
                      CheckboxListTile(
                        value: _agreedToTOS,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _agreedToTOS = newValue ?? false;
                          });
                        },
                        title: Row(
                          children: [
                            Text('I agree to the ', style: TextStyle(color: Colors.white)),
                            GestureDetector(
                              onTap: () {
                                // Navigate to terms and conditions page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                                );
                              },
                              child: Text(
                                'Terms and Conditions',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        checkColor: Colors.white,
                        activeColor: Colors.blue,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      SizedBox(height: 20),
                      // Signup button
                      ElevatedButton(
                        onPressed: _signup,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Sign Up', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',
                      style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
