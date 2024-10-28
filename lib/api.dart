
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';

// class TravelPlanPage extends StatefulWidget {
//   final String startingLocation;
//   final String destination;
//   final DateTime? startDate;
//   final DateTime? endDate;
//   final double? budget;
//   final List<String> selectedActivities;

//   TravelPlanPage({
//     required this.startingLocation,
//     required this.destination,
//     required this.startDate,
//     required this.endDate,
//     required this.budget,
//     required this.selectedActivities,
//   });

//   @override
//   _TravelPlanPageState createState() => _TravelPlanPageState();
// }

// class _TravelPlanPageState extends State<TravelPlanPage> {
//   String? itinerary;
//   bool isLoading = true;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       travelplan();
//     });
//   }

//   Future<void> travelplan() async {
//     String startDateFormatted = widget.startDate != null
//         ? DateFormat('yyyy-MM-dd').format(widget.startDate!)
//         : 'unknown';
//     String endDateFormatted = widget.endDate != null
//         ? DateFormat('yyyy-MM-dd').format(widget.endDate!)
//         : 'unknown';
//     String activities = widget.selectedActivities.isNotEmpty
//         ? widget.selectedActivities.join(", ")
//         : 'none';

//     try {
//       final response = await Gemini.instance.text(
//         "Create a comprehensive daily travel itinerary for a trip from ${widget.startingLocation} to ${widget.destination} from ${widget.startDate} to ${widget.endDate}. The budget for this trip is ${widget.budget}. Please include the planned activities at these places: ${widget.selectedActivities.join(", ")}. The structured itinerary should include: Morning, afternoon, and evening plans for each day. Activities and attractions to visit, local cuisine and drinks to try. Recommendations for accommodation, including hotels, hostels, or alternative options. Helpful tips, including transportation, safety, and cultural insights. The itinerary should be practical, enjoyable, and enriching for travelers. Destination: ${widget.destination}, Start Date: ${widget.startDate}, End Date: ${widget.endDate}, Budget: ${widget.budget}. Please format the itinerary clearly and concisely without using bullet points, asterisks, or bold text.",
//       );

//       setState(() {
//         itinerary = response?.output ?? "Failed to fetch trip plan.";
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         itinerary = "Error occurred while generating the plan.";
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         title: Text('Your Travel Plan'),
//         backgroundColor: Colors.transparent,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF1A1D24), Color(0xFF343A40)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: isLoading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Title for Travel Details
//                       Text(
//                         'Travel Details',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color:  Color(0xFF4CAF50),
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                       SizedBox(height: 16),

//                       // Starting Location
//                       Row(
//                         children: [
//                           Icon(Icons.place, color:  Color(0xFF4CAF50)),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Starting Location: ${widget.startingLocation}',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),

//                       // Destination
//                       Row(
//                         children: [
//                           Icon(Icons.flag, color:  Color(0xFF4CAF50)),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Destination: ${widget.destination}',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),

//                       // Start Date
//                       Row(
//                         children: [
//                           Icon(Icons.calendar_today,
//                               color:  Color(0xFF4CAF50)),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Start Date: ${widget.startDate != null ? DateFormat('MMM dd, yyyy').format(widget.startDate!) : 'unknown'}',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),

//                       // End Date
//                       Row(
//                         children: [
//                           Icon(Icons.calendar_today_outlined,
//                               color:  Color(0xFF4CAF50)),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'End Date: ${widget.endDate != null ? DateFormat('MMM dd, yyyy').format(widget.endDate!) : 'unknown'}',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),

//                       // Budget
//                       Row(
//                         children: [
//                           Icon(Icons.attach_money, color:  Color(0xFF4CAF50)),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Budget: \$${widget.budget?.toStringAsFixed(2) ?? 'unknown'}',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),

//                       // Activities
//                       Row(
//                         children: [
//                           Icon(Icons.check_circle_outline,
//                               color:  Color(0xFF4CAF50)),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Planned Activities: ${widget.selectedActivities.isNotEmpty ? widget.selectedActivities.join(", ") : 'None'}',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       // Spacing before itinerary
//                       SizedBox(height: 24),

//                       // Title for Itinerary
//                       Text(
//                         'Itinerary',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color:  Color(0xFF4CAF50),
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                       SizedBox(height: 16),

//                       // Itinerary content
//                       Text(
//                         itinerary ?? "No itinerary available.",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white70,
//                           height: 1.5, // To improve readability
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//       backgroundColor: Color(0xFF1A1D24),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firestore import

class TravelPlanPage extends StatefulWidget {
  final String startingLocation;
  final String destination;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? budget;
  final List<String> selectedActivities;

  TravelPlanPage({
    required this.startingLocation,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.budget,
    required this.selectedActivities,
  });

  @override
  _TravelPlanPageState createState() => _TravelPlanPageState();
}

class _TravelPlanPageState extends State<TravelPlanPage> {
  String? itinerary;
  bool isLoading = true;
  bool isSaving = false; // For showing loading spinner during save

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      travelplan();
    });
  }

  Future<void> travelplan() async {
    String startDateFormatted = widget.startDate != null
        ? DateFormat('yyyy-MM-dd').format(widget.startDate!)
        : 'unknown';
    String endDateFormatted = widget.endDate != null
        ? DateFormat('yyyy-MM-dd').format(widget.endDate!)
        : 'unknown';

    try {
      final response = await Gemini.instance.text(
        "Create a comprehensive daily travel itinerary for a trip from ${widget.startingLocation} to ${widget.destination} from ${widget.startDate} to ${widget.endDate}. The budget for this trip is ${widget.budget}. Please include the planned activities at these places: ${widget.selectedActivities.join(", ")}...",
      );

      setState(() {
        itinerary = response?.output ?? "Failed to fetch trip plan.";
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        itinerary = "Error occurred while generating the plan.";
        isLoading = false;
      });
    }
  }

  // Function to save the travel plan to Firestore
  Future<void> _saveTripPlan() async {
    setState(() {
      isSaving = true;
    });

    try {
      await FirebaseFirestore.instance.collection('trip_plans').add({
        'startingLocation': widget.startingLocation,
        'destination': widget.destination,
        'startDate': widget.startDate,
        'endDate': widget.endDate,
        'budget': widget.budget,
        'activities': widget.selectedActivities,
        'itinerary': itinerary,
        'createdAt': DateTime.now(),
      });

      // Show success message and return to previous screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Trip plan saved successfully!')),
      );
      Navigator.of(context).pop(); // Return to the previous screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save trip plan.')),
      );
    } finally {
      setState(() {
        isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Your Travel Plan'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1D24), Color(0xFF343A40)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Travel details (starting location, destination, etc.)
                      Text(
                        'Travel Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:  Color(0xFF4CAF50),
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      travelDetailsRow(
                          icon: Icons.place,
                          label: 'Starting Location',
                          value: widget.startingLocation),
                      travelDetailsRow(
                          icon: Icons.flag,
                          label: 'Destination',
                          value: widget.destination),
                      travelDetailsRow(
                          icon: Icons.calendar_today,
                          label: 'Start Date',
                          value: widget.startDate != null
                              ? DateFormat('MMM dd, yyyy')
                                  .format(widget.startDate!)
                              : 'unknown'),
                      travelDetailsRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'End Date',
                          value: widget.endDate != null
                              ? DateFormat('MMM dd, yyyy')
                                  .format(widget.endDate!)
                              : 'unknown'),
                      travelDetailsRow(
                          icon: Icons.attach_money,
                          label: 'Budget',
                          value: '\$${widget.budget?.toStringAsFixed(2) ?? 'unknown'}'),
                      travelDetailsRow(
                          icon: Icons.check_circle_outline,
                          label: 'Planned Activities',
                          value: widget.selectedActivities.isNotEmpty
                              ? widget.selectedActivities.join(", ")
                              : 'None'),

                      SizedBox(height: 24),
                      Text(
                        'Itinerary',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:  Color(0xFF4CAF50),
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        itinerary ?? "No itinerary available.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 24),

                      // Save and Cancel buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: isSaving ? null : _saveTripPlan,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            child: isSaving
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text("Save Trip",
                                    style: TextStyle(fontSize: 16)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            child: Text("Cancel",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
      backgroundColor: Color(0xFF1A1D24),
    );
  }

  Widget travelDetailsRow({required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        Icon(icon, color:  Color(0xFF4CAF50)),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            '$label: $value',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
