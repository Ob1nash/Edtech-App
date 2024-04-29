import 'package:flutter/material.dart';

class EnrollPage extends StatelessWidget {
  final String courseTitle;
  final String coursePrice;
  final String courseDescription;

  // Constructor for passing course data
  EnrollPage({
    required this.courseTitle,
    required this.coursePrice,
    required this.courseDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enroll in $courseTitle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display course price
            Text(
              'Price: $coursePrice',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Course description
            Text(
              courseDescription,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(), // Pushes the button to the bottom
            // Enroll button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action for enrolling, e.g., payment logic
                  print("Enroll button clicked");
                },
                child: Text("Proceed"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 40), // Button size
                  backgroundColor: Color.fromARGB(255, 63, 206, 27),
                  foregroundColor: Colors.white, // Button color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
