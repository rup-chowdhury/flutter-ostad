import 'package:flutter/material.dart';
import 'package:map_practice_for_future/screens/home_screen.dart';
import 'package:map_practice_for_future/screens/map_screen.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4F5),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Login',
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
              hint: 'Password',
              icon: Icons.lock,
              isObscured: true,
            ),
            SizedBox(height: 16), // Gap between inputs
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B7BF9),
                ),
              ),
            ),
            SizedBox(height: 16), // Gap before login button
            Container(
              height: 56,
              width: 240,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue button press
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => TransformLatLng()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF37AFE3),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16), // Gap before OR text
            Text(
              'OR',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16), // Gap before Google login button
            SizedBox(
              height: 56,
              width: 240,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Google login button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE9E8E9),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: Image.asset(
                  'assets/images/icon_google.png', // Replace with your Google icon path
                  height: 35,
                  width: 35,
                ),
                label: Text(
                  'Login with Google',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Gap before sign up text
            Text(
              'Don\'t have an account? Sign Up',
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
  }) {
    return TextField(
      keyboardType: inputType,
      obscureText: isObscured,
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