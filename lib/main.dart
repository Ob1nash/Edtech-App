import 'package:edtech/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';   // Import the page files
import 'pages/library_page.dart';
import 'pages/courses_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false; // Variable to track login state

  void _login() {
    setState(() {
      _isLoggedIn = true; // User is now logged in
    });
  }
   void _SignUp() {
    // Logic to handle sign-up
    print("Navigating to sign-up");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      // home: MainPage(), // Use the MainPage as the starting page
      home: _isLoggedIn ? MainPage() : LoginPage(onLogin: _login, onSignUp: _SignUp), // Redirect to MainPage after login
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2; // Default to the Home tab
  final List<Widget> _pages = [
    LibraryPage(),  // Left side
    CoursesPage(),
    HomePage(),    // Middle
    ProfilePage(),
    SettingsPage(),
    InfoPage() // Right side
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), 
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage()),
              );
              print("Information icon clicked");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentIndex = 2; // Home index
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                setState(() {
                  _currentIndex = 4; // Settings index
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
              onTap: () {
                print ("Logout");
              },
            ),

          ],
        ),
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the current active tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the active tab
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Home in the middle
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed, // Keeps all icons visible
      ),
    );
  }
}
