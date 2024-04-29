import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/flutter_logo.jpg', // Path to your organization's logo
                height: 50, // Adjust as needed
              ),
            ),
            SizedBox(height: 16),
            Text(
              'About Our Organization',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'We are a leading educational technology company specializing in online courses. '
              'Our mission is to provide accessible, high-quality education to learners worldwide. '
              'We offer a wide range of courses designed by experts in various fields.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email: contact@edtech.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: (123) 456-7890',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
