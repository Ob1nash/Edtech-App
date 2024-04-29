import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WatchVideoPage extends StatelessWidget {
  final String courseTitle;
  final String recentLecture;
  final List<String> otherLectures;
  final int currentLectureIndex;

  WatchVideoPage({
    required this.courseTitle,
    required this.recentLecture,
    required this.otherLectures,
    required this.currentLectureIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Video - $courseTitle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(
                VideoPlayerController.networkUrl(Uri.parse(recentLecture)),
              ),
            ),
            SizedBox(height: 12), // Add spacing above the buttons
            // Row for Previous and Next buttons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Ensures even spacing
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16), // Margin on the left
                  child: ElevatedButton(
                    onPressed: currentLectureIndex > 0
                        ? () {
                            print("Navigating to previous video");
                            // Logic for previous video
                          }
                        : null,
                    child: Text("Previous Video"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16), // Margin on the right
                  child: ElevatedButton(
                    onPressed: currentLectureIndex < otherLectures.length - 1
                        ? () {
                            print("Navigating to next video");
                            // Logic for next video
                          }
                        : null,
                    child: Text("Next Video"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Additional spacing
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Other Lectures',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: otherLectures.length,
              itemBuilder: (context, index) {
                final lecture = otherLectures[index];
                return ListTile(
                  leading: Icon(Icons.play_circle_fill),
                  title: Text(lecture),
                  onTap: () {
                    // Handle lecture selection
                    print("Playing $lecture");
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
