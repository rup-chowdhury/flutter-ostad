import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/forgot_password_otp_screen.dart';
import 'package:project_to_do_app/ui/screens/sign_in_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                  "Set Password",
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Minimum length of password should be 8 letters",
                  style: textTheme.titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildVerifyEmailForm(),
                const SizedBox(
                  height: 40,
                ),
                _buildHaveAccountSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyEmailForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Password"),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Confirm Password"),
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  Widget _buildHaveAccountSection() {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 0.5),
                text: "Have account? ",
                children: [
                  TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: AppColor.themeColor,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _onTapSignIn),
                ]),
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
          (_) => false,
    );
  }

  void _onTapForgotPassword() {
    //TODO: implement forgot password button action
  }

  void _onTapSignIn() {

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
          (_) => false,
    );
  }
}
