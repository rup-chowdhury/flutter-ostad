import 'package:counter_app_with_getx/counter_controller.dart';
import 'package:counter_app_with_getx/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GetBuilder<CounterController>(
          builder: (counterController) {
            return Text(
              '${counterController.counter}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/setting', (predicate) => false);
            },
            child: const Text('Settings'))
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
