import 'package:flutter/material.dart';

class WatarTrackerApp extends StatefulWidget {
  const WatarTrackerApp({super.key});

  @override
  State<WatarTrackerApp> createState() => _WatarTrackerAppState();
}

class _WatarTrackerAppState extends State<WatarTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Water Tracker", style: TextStyle(
          fontSize: 18
        ),)),
      ),
    );
  }
}
