import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function onLogin; // Callback for successful login
  final Function onSignUp; // Callback for the sign-up action

  LoginPage({
    required this.onLogin,
    required this.onSignUp,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    if (_usernameController.text == 'user' && _passwordController.text == 'password') {
      widget.onLogin(); // Successful login
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide password
            ),
            SizedBox(height: 16), // Spacing between inputs and buttons
            ElevatedButton(
              onPressed: _handleLogin, // Login logic
              child: Text('Login'),
            ),
            SizedBox(height: 16), // Spacing between Login and Sign Up sections
            // "Don't have an account? Sign up" section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                TextButton(
                  onPressed: () {
                    widget.onSignUp(); // Navigate to sign-up or handle sign-up action
                  },
                  child: Text("Sign Up"), // Sign-up button text
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
