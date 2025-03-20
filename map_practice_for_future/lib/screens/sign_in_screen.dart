import 'package:flutter/material.dart';
import 'package:map_practice_for_future/screens/map_screen.dart';
import 'package:map_practice_for_future/screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4F5),
      body: Stack(children: [
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
          color: Colors.cyanAccent.withOpacity(
              0.1), // Adding a dark overlay for better text visibility
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                height: 480,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        spreadRadius: 5),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.3],
                    colors: [
                      Color.fromARGB(255, 190, 238, 248),
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(12),
                        child:
                            Image.asset('assets/images/sign_in_logo.png.png'),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(200, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.cyanAccent.shade100,
                                blurRadius: 15,
                                offset: Offset(2, 5),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Gap between title and first input
                      _buildTextField(
                        hint: 'Email ID',
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      // Gap between inputs
                      _buildTextField(
                        hint: 'Password',
                        icon: Icons.lock,
                        isObscured: true,
                      ),
                      SizedBox(height: 16),
                      // Gap between inputs
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(100, 77, 77, 77),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Gap before login button
                      SizedBox(
                        height: 40,
                        width: 340,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle continue button press
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapScreen()));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => TransformLatLng()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.black87,
                            // padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Gap before OR text
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Gap before Google login button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          'Don\'t have an account? Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
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
        fillColor: Color.fromARGB(100, 222, 222, 222),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
