import 'package:counter_app_with_getx/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String name = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Get.back();
                },
                child: const Text('Back')),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Get.off(() => const ProfileScreen(), transition: Transition.fadeIn);
                },
                child: const Text('Profile'))
          ],
        ),
      ),
    );
  }
}
