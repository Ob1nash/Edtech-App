import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Settings'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [

                ListTile(
                  leading: Icon(Icons.monochrome_photos),
                  title: Text("Change Theme"),
                  onTap: () {
                    // Navigate to Password Change
                    print("Change Theme");
                  },
                ),
                Divider(),

                // Privacy Section
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text("Privacy"),
                  onTap: () {
                    // Navigate to Privacy Settings
                    print("Go to Privacy Settings");
                  },
                ),
                Divider(), // Divider between items
                // Password Management
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Change Password"),
                  onTap: () {
                    // Navigate to Password Change
                    print("Change Password");
                  },
                ),
                Divider(), // Divider between items
                // Log Out
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log Out"),
                  onTap: () {
                    // Handle Log Out logic
                    print("Log Out");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
