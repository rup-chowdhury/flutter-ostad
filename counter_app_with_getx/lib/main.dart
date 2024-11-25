import 'package:counter_app_with_getx/counter_controller.dart';
import 'package:counter_app_with_getx/home_screen.dart';
import 'package:counter_app_with_getx/profile_screen.dart';
import 'package:counter_app_with_getx/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      routes: {
        HomeScreen.name : (context) => const HomeScreen(),
        ProfileScreen.name : (context) => const ProfileScreen(),
        SettingsScreen.name : (context) => const SettingsScreen()
      },
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}
