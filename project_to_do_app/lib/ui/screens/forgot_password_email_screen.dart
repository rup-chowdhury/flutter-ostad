import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
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
                const SizedBox(height: 82,),
                Text(
                  "Your Email Address",
                  style:
                      textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 24,),
                TextFormField(decoration: InputDecoration(
                  hintText: "Email"
                ),),
                SizedBox(height: 8,),
                TextFormField(decoration: InputDecoration(
                  hintText: "Password"
                ),),
                SizedBox(height: 24,),
                ElevatedButton(onPressed: (){
                }, child: Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
