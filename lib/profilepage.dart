import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  final String userId; // User ID to fetch specific user's data

  ProfilePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(userId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('User not found.'));
          }

          // Fetching user data from Firestore
          final userData = snapshot.data!;
          final firstName = userData['firstName'] ?? 'N/A';
          final lastName = userData['lastName'] ?? 'N/A';
          final email = userData['email'] ?? 'N/A';
          final interests = List<String>.from(userData['interests'] ?? []);
          final location = userData['location'] ?? 'N/A';
          final profilePicture = userData['profilePicture'] ?? 'assets/default_profile_picture.jpg'; // Default picture path

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header (Photo, Name, Email)
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profilePicture), // Use fetched profile picture
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$firstName $lastName',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(email, style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Interests Section
                Text('Interests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: interests
                      .map((interest) => Chip(
                            label: Text(interest),
                          ))
                      .toList(),
                ),
                SizedBox(height: 20),

                // Location Section
                Text('Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(location),
                  ],
                ),
                SizedBox(height: 20),

                // Profile Actions (Edit, Logout)
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Edit Profile Page
                        },
                        child: Text('Edit Profile'),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          // Handle logout functionality
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



