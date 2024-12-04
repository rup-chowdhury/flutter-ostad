import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/signUpScreen';

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
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email"),
            validator: (String? value) {
              if(value?.isEmpty ?? true) {
                return "Enter valid email";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _firstNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: "First Name"),
            validator: (String? value) {
              if(value?.isEmpty ?? true) {
                return "Enter first name";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: "Last Name"),
            validator: (String? value) {
              if(value?.isEmpty ?? true) {
                return "Enter last name";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _mobileTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Mobile"),
            validator: (String? value) {
              if(value?.isEmpty ?? true) {
                return "Enter mobile number";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: "Password"),
            validator: (String? value) {
              if(value?.isEmpty ?? true) {
                return "Enter password";
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
    if (_formKey.currentState!.validate()){
      _signUp();
    }
  }

  Future<void> _signUp() async{
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text
    };

    NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.registrationUrl,
        body: requestBody,
    );

    _inProgress = false;
    setState(() {});
    if(response.isSuccess) {
      _clearTextFields();
      showSnackBarMessage(context, 'New User Created');
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }

  }

  void _clearTextFields() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  void _onTapSignIn() {
    //TODO: action for pressing Sign up button
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
