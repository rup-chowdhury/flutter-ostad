import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

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
                  "Join With Us",
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildSignUpForm(),
                const SizedBox(
                  height: 24,
                ),
                _buildHaveAccountSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
          controller: _emailTEController,
          decoration: const InputDecoration(hintText: "Email"),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _firstNameTEController,
          decoration: const InputDecoration(hintText: "First Name"),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _lastNameTEController,
          decoration: const InputDecoration(hintText: "Last Name"),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _mobileTEController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Mobile"),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _passwordTEController,
          decoration: const InputDecoration(hintText: "Password"),
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
                style: TextStyle(
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
    //TODO: implement action for Next Button
  }

  void _onTapForgotPassword() {
    //TODO: implement forgot password button action
  }

  void _onTapSignIn() {
    //TODO: action for pressing Sign up button
    Navigator.pop(context);
  }
}
