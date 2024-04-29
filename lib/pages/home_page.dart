import 'package:flutter/material.dart';
import 'package:edtech/pages/enroll_page.dart';
import 'package:edtech/pages/course_details.dart';
import 'package:edtech/pages/watch_video_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Padding at the top
            Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'Popular Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180, // Increase height to accommodate buttons
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildPopularCourses(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'Enrolled Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150, // Enrolled courses section
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildEnrolledCourses(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'Important Dates',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100, // Horizontal list for important dates
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildImportantDates(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPopularCourses(context) {
    return [
      _buildPopularCourseCard(context, 'Course 1', 'assets/course1.jpg'),
      _buildPopularCourseCard(context, 'Course 2', 'assets/course2.jpg'),
      _buildPopularCourseCard(context, 'Course 3', 'assets/course3.jpg'),
    ]; 
  }

  List<Widget> _buildEnrolledCourses(context) {
    return [
      _buildEnrolledCourseCard(context, 'Enrolled 1', 'assets/course1.jpg'),
      _buildEnrolledCourseCard(context, 'Enrolled 2', 'assets/course2.jpg'),
      _buildEnrolledCourseCard(context, 'Enrolled 3', 'assets/course3.jpg'),
    ];
  }

  List<Widget> _buildImportantDates() {
    return [
      _buildDateCard('Exam 1', '15 April'),
      _buildDateCard('Exam 2', '30 April'),
      _buildDateCard('Exam 3', '10 May'),
    ];
  }

  Widget _buildPopularCourseCard(BuildContext context, title, String imagePath) {
    return Card(
      child: Container(
        width: 160, // Wider to fit buttons
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, height: 80),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center, // Corrected text alignment
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {


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
                    print("Enrolled in $title");
                  },


                  child: Text('Enroll'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Less padding
                    minimumSize: Size(60, 30), // Smaller button
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Colors.blue, // Blue enroll button
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
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
                    print("Details for $title");
                  },


                  child: Text('Details'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Less padding
                    minimumSize: Size(60, 30), // Smaller button
                    
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Color.fromARGB(255, 8, 8, 8) // Grey details button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnrolledCourseCard(BuildContext context, title, String imagePath) {
    return Card(
      child: Container(
        width: 120, // Width to fit the watch button
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, height: 80),
            SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center, // Corrected text alignment
              style: TextStyle(fontSize: 12),
              
            ),
            Flexible(
            child: ElevatedButton(
              onPressed: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WatchVideoPage(
                              courseTitle: 'Course 1', // Course title
                              recentLecture: 'https://www.youtube.com/watch?v=kz184QIO4ZQ&list=PLxCzCOWd7aiEXg5BV10k9THtjnS48yI-T', // Video URL
                              otherLectures: ['Lecture 2', 'Lecture 3', 'Lecture 4'], // 
                               currentLectureIndex: 0,
                              
                            ),
                          ),
                        );
                print("Watching $title");
              },

              
              child: Text('Watch'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), // Less padding
                minimumSize: Size(50, 30), // Smaller button
                backgroundColor: Colors.blue, // Blue watch button
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCard(String title, String date) {
    return Card(
      child: Container(
        width: 80,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(date, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center, // Corrected text alignment
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
