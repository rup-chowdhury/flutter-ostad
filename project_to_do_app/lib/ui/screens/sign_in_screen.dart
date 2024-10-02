import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 82,
                ),
                Text(
                  "Get Started With",
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildSignInForm(),
                const SizedBox(height: 24,),
                _buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapForgotPassword() {
    //TODO: implement forgot password button action
  }

  Widget _buildSignUpSection() {
    return Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: _onTapForgotPassword,
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.5),
                          text: "Don't have an account? ",
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: AppColor.themeColor,
                                )),
                          ]),
                    ),
                  ],
                ),
              );
  }

  Widget _buildSignInForm() {
    return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              );
  }

  void _onTapNextButton(){
    //TODO: implement action for Next Button
  }
}
