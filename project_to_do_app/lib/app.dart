import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_to_do_app/controller_binder.dart';
import 'package:project_to_do_app/ui/screens/add_new_task_screen.dart';
import 'package:project_to_do_app/ui/screens/cancelled_task_screen.dart';
import 'package:project_to_do_app/ui/screens/completed_task_screen.dart';
import 'package:project_to_do_app/ui/screens/forgot_password_email_screen.dart';
import 'package:project_to_do_app/ui/screens/forgot_password_otp_screen.dart';
import 'package:project_to_do_app/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:project_to_do_app/ui/screens/new_task_screen.dart';
import 'package:project_to_do_app/ui/screens/profile_screen.dart';
import 'package:project_to_do_app/ui/screens/progress_task_screen.dart';
import 'package:project_to_do_app/ui/screens/reset_password_screen.dart';
import 'package:project_to_do_app/ui/screens/sign_in_screen.dart';
import 'package:project_to_do_app/ui/screens/sign_up_screen.dart';
import 'package:project_to_do_app/ui/screens/splash_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManagerApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColor.themeColor,
          textTheme: const TextTheme(),
          inputDecorationTheme: _inputDecorationTheme(),
          elevatedButtonTheme: _elevatedButtonThemeData()
      ),
      initialRoute: '/',
      routes: {
        SplashScreen.name : (context)=> const SplashScreen(),
        AddNewTaskScreen.name : (context)=> const AddNewTaskScreen(),
        CancelledTaskScreen.name : (context)=> const CancelledTaskScreen(),
        CompletedTaskScreen.name : (context)=> const CompletedTaskScreen(),
        ForgotPasswordEmailScreen.name : (context)=> const AddNewTaskScreen(),
        ForgotPasswordOTPScreen.name : (context)=> const ForgotPasswordOTPScreen(),
        MainBottomNavBarScreen.name : (context)=> const MainBottomNavBarScreen(),
        NewTaskScreen.name : (context)=> const NewTaskScreen(),
        ProfileScreen.name : (context)=> const ProfileScreen(),
        ProgressTaskScreen.name : (context)=> const ProgressTaskScreen(),
        ResetPasswordScreen.name : (context)=> const ResetPasswordScreen(),
        SignInScreen.name : (context)=> const SignInScreen(),
        SignUpScreen.name : (context)=> const SignUpScreen(),
      },
      initialBinding: ControllerBinder(),
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData(){
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.themeColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w300
      ),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      errorBorder: _inputBorder(),
      focusedBorder: _inputBorder()
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
