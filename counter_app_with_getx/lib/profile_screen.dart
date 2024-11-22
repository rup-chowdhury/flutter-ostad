import 'package:counter_app_with_getx/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              // Navigator.pop(context);
              Get.back(
                result: 'sdhhjsd'
              );
            }, child:
            const Text('Back')),
            TextButton(onPressed: (){
              Get.offAll(() => const HomeScreen(), opaque: false, transition: Transition.leftToRight);
            },
                child: const Text('Home'))
          ],
        ),
      ),
    );
  }
}
