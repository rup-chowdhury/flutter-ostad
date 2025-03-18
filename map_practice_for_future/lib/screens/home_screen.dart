import 'package:flutter/material.dart';
import 'package:map_practice_for_future/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_background.png'),
                  // Update with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay
            Container(
              color: Colors
                  .black45, // Adding a dark overlay for better text visibility
            ),
            // Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title Text
                  Text(
                    'Be safe\n on the roads',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40), // Spacing
                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to sign in screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2), // Button color
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20), // Spacing
                  // Create Account Text
                  GestureDetector(
                    onTap: () {
                      // Navigate to create account screen
                    },
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
