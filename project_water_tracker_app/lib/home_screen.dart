import 'package:flutter/material.dart';

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
        title: const Center(
            child: Text(
          "Water Tracker",
          style: TextStyle(fontSize: 18),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("12", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),),
          Text("Glass/s"),
          SizedBox(
            height: 16,
          ),
          TextButton(onPressed: () {}, child: Text("Add")),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
