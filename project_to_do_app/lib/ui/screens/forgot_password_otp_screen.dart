import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_to_do_app/ui/screens/sign_in_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';

class ForgotPasswordOTPScreen extends StatefulWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  State<ForgotPasswordOTPScreen> createState() =>
      _ForgotPasswordOTPScreenState();
}

class _ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
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
                  "PIN Verification",
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "A 6 digits verification OTP has been sent to your email address",
                  style: textTheme.titleSmall?.copyWith(color: Colors.grey),
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
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
          appContext: context,
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (_) => false,
    );
  }
}
