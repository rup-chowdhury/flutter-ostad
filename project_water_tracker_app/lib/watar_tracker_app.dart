import 'package:flutter/material.dart';
import 'package:project_water_tracker_app/home_screen.dart';

class WatarTrackerApp extends StatefulWidget {
  const WatarTrackerApp({super.key});

  @override
  State<WatarTrackerApp> createState() => _WatarTrackerAppState();
}

class _WatarTrackerAppState extends State<WatarTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
