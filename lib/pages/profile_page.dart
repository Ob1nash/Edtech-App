import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Profile information and progress data
  String profilePicture = 'assets/default_profile.jpg';
  String name = 'Paul Attredis';
  String standard = '12th Grade';
  String goal = 'Engineer';
  double progress = 0.65; // Example progress: 65%

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // Profile Picture Section
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Change profile picture logic
                    print("Change profile picture");
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profilePicture),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Editable fields for name, standard, goal
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                initialValue: standard,
                decoration: InputDecoration(labelText: "Standard"),
                onChanged: (value) {
                  setState(() {
                    standard = value;
                  });
                },
              ),
              TextFormField(
                initialValue: goal,
                decoration: InputDecoration(labelText: "Goal"),
                onChanged: (value) {
                  setState(() {
                    goal = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text(
                "Progress",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Progress Bar with Percentage
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 8), // Spacing between progress bar and percentage
                  Text(
                    "${(progress * 100).toStringAsFixed(2)}%", // Display percentage
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
