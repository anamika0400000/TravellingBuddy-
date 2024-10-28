import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SavedTripPlansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Saved Trip Plans'),
        backgroundColor: Color(0xFF1A1D24),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('trip_plans').snapshots(),
        builder: (context, snapshot) {
          // Check for loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Check for errors
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Check for no data
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No trip plans found.'));
          }

          // Fetching trip plans from snapshot
          final tripPlans = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tripPlans.length,
            itemBuilder: (context, index) {
              final tripPlan = tripPlans[index];
              final startingLocation = tripPlan['startingLocation'] ?? 'N/A';
              final destination = tripPlan['destination'] ?? 'N/A';
              final budget = tripPlan['budget']?.toString() ?? '0';
              final activities = tripPlan['activities']?.join(', ') ?? 'None';
              final report = tripPlan['itinerary'] ?? 'None';

              return Card(
                color: Colors.black54,
                
                margin: EdgeInsets.all(10),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trip to $destination',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Starting Location: $startingLocation'),
                      Text('Budget: \$${budget}'),
                      Text('Activities: $activities'),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          _showTripPlanDetails(context, tripPlan);
                        },
                        child: Text('View Details'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to show trip plan details in a dialog
  void _showTripPlanDetails(BuildContext context, DocumentSnapshot tripPlan) {
    final report = tripPlan['itinerary'] ?? 'None';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Trip Plan Details',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF1A1D24), // Match background color
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Trip Plan: $report',
                  style: TextStyle(
                      color: Colors.white), // White text for visibility
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK',
                  style: TextStyle(
                      color: Colors.white)), // White text for visibility
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
