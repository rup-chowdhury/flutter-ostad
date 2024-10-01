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
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 82,),
              Text(
                "Get Started With",
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
              }, child: Icon(Icons.arrow_forward_ios),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.themeColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                fixedSize: Size.fromWidth(double.maxFinite) 
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
