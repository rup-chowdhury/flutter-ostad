import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/splash_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColor.themeColor,
          textTheme: const TextTheme(),
          inputDecorationTheme: _inputDecorationTheme(),
          elevatedButtonTheme: _elevatedButtonThemeData()
      ),
      home: SplashScreen(),
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
      hintStyle: TextStyle(
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
