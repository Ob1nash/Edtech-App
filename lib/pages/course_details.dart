import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  final String courseTitle;
  final String courseImage;
  final String courseDescription;

  // Constructor to pass the course title, image, and description
  CourseDetailsPage({
    required this.courseTitle,
    required this.courseImage,
    required this.courseDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course thumbnail
            Image.asset(courseImage, fit: BoxFit.cover),
            SizedBox(height: 16), // Spacing between elements
            // Enroll Now button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Enroll action
                  print("Enroll Now clicked for $courseTitle");
                },
                child: Text("Enroll Now"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 40), // Larger button
                  backgroundColor: Colors.blue, // Button color
                ),
              ),
            ),
            SizedBox(height: 16), // Spacing
            // Course description
            Text(
              courseDescription,
              style: TextStyle(fontSize: 16), // Description style
            ),
            Spacer(), // Fills remaining space to push the Contact Us button to the bottom
            // Contact Us button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Contact Us action
                  print("Contact Us clicked");
                },
                child: Text("Contact Us"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 40), // Larger button
                  backgroundColor: Colors.blue, // Button color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
