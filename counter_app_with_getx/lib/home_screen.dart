import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: GetBuilder<CounterController>(
          init: counterController,
          builder: (counterController){
            return Text(
              '${counterController.counter}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddButton() {
    counterController.increment();
  }
}

class CounterController extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update();
  }
}
