import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final List<Map<String, String>> lectureNotes=[
    {
    'title': 'Lecture 1 Notes',
    'description': 'Notes for Lecture 1 on Course Topics',
  },
  {
    'title': 'Lecture 2 Notes',
    'description': 'Notes for Lecture 2 on Advanced Topics',
  },

  ];

   final List<Map<String, String>> previousYearQuestions=[
    {
    'title': '2022 CUET paper',
    'description': 'Description',
  },
  {
    'title': '2023 CUET paper',
    'description': 'Description',
  },
   ];
 

  // LibraryPage({
  //   required this.lectureNotes, // List of lecture notes with title and description
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Library'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lecture Notes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: lectureNotes.length, // Number of notes
                itemBuilder: (context, index) {
                  final note = lectureNotes[index];
                  return Card(
                    child: ListTile(
                      title: Text(note['title'] ?? 'Untitled'),
                      subtitle: Text(note['description'] ?? 'No description available'),
                      onTap: () {
                        // Handle note opening logic, e.g., navigate to a details page
                        print("Opening note: ${note['title']}");
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            Text(
              'Previous Year Questions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: previousYearQuestions.length, // Number of questions
                itemBuilder: (context, index) {
                  final paper = previousYearQuestions[index];
                  return Card(
                    child: ListTile(
                      title: Text(paper['title'] ?? 'Untitled'),
                      subtitle: Text(paper['description'] ?? 'No description available'),
                      onTap: () {
                        // Handle question opening logic, e.g., navigate to a details page
                        print("Opening paper: ${paper['title']}");
                      }
                    )
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
