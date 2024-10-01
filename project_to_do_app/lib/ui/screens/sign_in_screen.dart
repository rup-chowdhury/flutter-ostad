import 'package:flutter/material.dart';
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
      body: ScreenBackground(child: Column(
        children: [
          Text("Get Started With", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),)
        ],
      ),),
    );
  }
}
