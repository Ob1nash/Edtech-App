import 'package:flutter/material.dart';
import 'package:edtech/pages/course_details.dart';
import 'package:edtech/pages/enroll_page.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Courses'),
      // ),
      
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            SizedBox(height: 20),
            Text(
              'Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
            Padding(
              padding: EdgeInsets.all(16.0),
              
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for courses...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        // Search action
                        print("Search button clicked");
                      },
                      child: Text("Search"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue, // Blue color for the button
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Grid of course cards
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2, // 2 cards in a row
              crossAxisSpacing: 16, // Space between columns
              mainAxisSpacing: 16, // Space between rows
              padding: EdgeInsets.all(16),
              children: _buildCourseCards(context), // Generate course cards
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCourseCards(BuildContext context) {
    return [
      _buildCourseCard(context, 'Course 1', 'assets/course1.jpg'),
      _buildCourseCard(context, 'Course 2', 'assets/course2.jpg'),
      _buildCourseCard(context, 'Course 3', 'assets/course3.jpg'),
      _buildCourseCard(context, 'Course 4', 'assets/course1.jpg'),
      _buildCourseCard(context, 'Course 5', 'assets/course2.jpg'),
      _buildCourseCard(context, 'Course 6', 'assets/course3.jpg'),
      _buildCourseCard(context, 'Course 7', 'assets/course1.jpg'),
      _buildCourseCard(context, 'Course 8', 'assets/course3.jpg'),
    ];
  }

  Widget _buildCourseCard( BuildContext context, String title, String imagePath) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 100),
          SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigation to EnrollPage
                    Navigator.push(
                      context, // Ensure correct context
                      MaterialPageRoute(
                        builder: (context) => EnrollPage(
                          courseTitle: 'Course 1', // Pass course title
                          coursePrice: '99.99 USD', // Example price
                          courseDescription:
                              "This is the description of Course 1.", // Pass course description
                        ),
                      ),
                    );
                  },


                  child: Text('Enroll Now'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2), // Less padding
                    minimumSize: Size(50, 30), // Smaller button
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              Flexible(
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to CourseDetailsPage

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailsPage(
                          courseTitle: title,
                          courseImage: imagePath,
                          courseDescription:
                              "This is the course description for $title.",
                        ),
                      ),
                    );
                  },


                  child: Text('Details'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    minimumSize: Size(50, 30),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
