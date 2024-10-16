import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/screens/forgot_password_email_screen.dart';
import 'package:project_to_do_app/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:project_to_do_app/ui/screens/sign_up_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _inProgress = false;

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
                const SizedBox(
                  height: 24,
                ),
                _buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email"),
            validator: (String? value) {
              if(value?.isEmpty ?? true){
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _passwordTEController,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Password"),
            validator: (String? value) {
              if(value?.isEmpty ?? true){
                return 'Enter your password';
              }
              if(value!.length <= 6){
                return 'Enter password with more than 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Visibility(
            visible: _inProgress == false,
            replacement: const CenteredCircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapNextButton,
              child: const Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
        ],
      ),
    );
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
            text: TextSpan(
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
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _onTapSignUp),
                ]),
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    if(!_formKey.currentState!.validate()){
      return;
    }
    _signIn();
  }

  Future<void> _signIn() async{
    _inProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.postRequest(url: Urls.loginUrl);
    _inProgress = false;
    setState(() {});
    if(response.isSuccess) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainBottomNavBarScreen()), (value) => false);
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }


  void _onTapForgotPassword() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordEmailScreen()));
  }

  void _onTapSignUp() {
    //TODO: action for pressing Sign up button
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}
