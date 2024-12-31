import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_map_demo/screens/sign_in_screen.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
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
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )
                  ),
                  TextSpan(
                    text: '  Sign In',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => _onTapSignIn(context)
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );

  }
  void _onTapSignIn(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
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

