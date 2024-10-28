import 'package:flutter/material.dart';
import 'package:travelling_buddy/Homepage.dart';
import 'package:travelling_buddy/profilepage.dart';

import 'savedtrips.dart';

class home extends StatelessWidget {
  var userId;

  @override
  home({  userId});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF1A1D24),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.jpg', // Make sure to add your logo in the assets folder
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Travelling Buddy',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Card
            GestureDetector(
              onTap: () {
                // Navigate to Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            userId: '',
                          )),
                );
              },
              child: Card(
                elevation: 4,
                color: Color(0xFF23272F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person, size: 40, color: Color(0xFF4CAF50)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Profile',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Color(0xFF4CAF50)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Plan Trip Card
            GestureDetector(
              onTap: () {
                // Navigate to Plan Trip Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Card(
                color: Color(0xFF23272F),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add_location,
                          size: 40, color: Color(0xFF4CAF50)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Plan Trip',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Color(0xFF4CAF50)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Preplanned Trip Card
            GestureDetector(
              onTap: () {
                // Navigate to Preplanned Trip Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedTripPlansPage()),
                );
              },
              child: Card(
                color: Color(0xFF23272F),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.book, size: 40, color: Color(0xFF4CAF50)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Preplanned Trip',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Color(0xFF4CAF50)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
