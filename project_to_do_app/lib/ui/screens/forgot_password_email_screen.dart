import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/screens/forgot_password_otp_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();

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
                  "Your Email Address",
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "A 6 digits verification OTP will be sent to your email address",
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
          controller: _emailTEController,
          decoration: const InputDecoration(hintText: "Email"),
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
                      style: const TextStyle(
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
    sendOTP();
  }

  Future<void> sendOTP() async{
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.sendOTPtoEmail(_emailTEController.text.toString() ?? ''));
    setState(() {});
    if(response.isSuccess) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordOTPScreen(),),);
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  // void _onTapForgotPassword() {
  //   //TODO: implement forgot password button action
  // }

  void _onTapSignIn() {
    //TODO: action for pressing Sign up button
    Navigator.pop(context);
  }
}
