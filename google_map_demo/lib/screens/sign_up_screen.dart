import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16), // Gap between title and first input
            _buildTextField(
              hint: 'Email ID',
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16), // Gap between inputs
            _buildTextField(
              hint: 'Full Name',
              icon: Icons.person,
            ),
            SizedBox(height: 16), // Gap between inputs
            _buildTextField(
              hint: 'Mobile',
              icon: Icons.phone,
              inputType: TextInputType.phone,
              textColor: Color(0xFF3E80F6),
            ),
            SizedBox(height: 16), // Gap between inputs
            _buildTextField(
              hint: 'Password',
              icon: Icons.lock,
              isObscured: true,
            ),
            SizedBox(height: 16), // Gap between inputs
            Text(
              '', // Placeholder for policy hint
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16), // Gap before button
            Container(
              height: 52,
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF37AFE3),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16), // Gap before login text
            Text(
              'Already have an account? Log in',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    TextInputType? inputType,
    bool isObscured = false,
    Color? textColor,
  }) {
    return TextField(
      keyboardType: inputType,
      obscureText: isObscured,
      style: TextStyle(color: textColor ?? Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}