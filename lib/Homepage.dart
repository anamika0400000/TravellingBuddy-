
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'api.dart'; // Assume this contains your API logic

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? startDate;
  DateTime? endDate;
  double? budget;
  List<String> activities = [
    'Adventure',
    'Relaxation',
    'Culture',
    'Food & Wine',
    'Nature',
    'City Break',
    'Sports',
    'Shopping'
  ];
  List<String> selectedActivities = [];

  // TextEditingController for text fields
  TextEditingController destinationController = TextEditingController();
  TextEditingController startinglocatin = TextEditingController();

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  // Function to reset the form fields
  void _resetForm() {
    setState(() {
      destinationController.clear();
      startinglocatin.clear();
      startDate = null;
      endDate = null;
      budget = null;
      selectedActivities.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        backgroundColor: Color(0xFF23272F),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.jpg', // Your app logo
            height: 40, // Adjust the size of the logo
          ),
        ),
        title: Text(
          'Plan My Trip',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              // Add functionality to navigate to profile page or other action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Enter Starting Location",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: startinglocatin,
              decoration: InputDecoration(
                hintText: "Enter Starting Location",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF2C3038),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Enter destination",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                hintText: "Enter destination",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF2C3038),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Enter the dates for your travel",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C3038),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            startDate != null
                                ? DateFormat('MMMM dd, yyyy').format(startDate!)
                                : "Starting date",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.calendar_today, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C3038),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            endDate != null
                                ? DateFormat('MMMM dd, yyyy').format(endDate!)
                                : "Ending date",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.calendar_today, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Specify your budget [in USD] for the travel",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "500",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF2C3038),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  budget = double.tryParse(value);
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "Interests/Activities",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: activities.map((activity) {
                return FilterChip(
                  label: Text(activity),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: Color(0xFF2C3038),
                  selectedColor: Color(0xFF4CAF50),
                  selected: selectedActivities.contains(activity),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedActivities.add(activity);
                      } else {
                        selectedActivities.remove(activity);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TravelPlanPage(
                        destination: destinationController.text,
                        startingLocation: startinglocatin.text,
                        startDate: startDate,
                        endDate: endDate,
                        budget: budget,
                        selectedActivities: selectedActivities,
                      ),
                    ),
                  ).then((_) {
                    // Reset form after the plan has been generated
                    _resetForm();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: Color(0xFF4CAF50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Plan My Trip",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
