import 'package:flutter/material.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Icons.new_label),
          label: "New",
        ),
        NavigationDestination(
          icon: Icon(Icons.check_box),
          label: "Completed",
        ),
        NavigationDestination(
          icon: Icon(Icons.close),
          label: "Cancelled",
        ),
        NavigationDestination(
          icon: Icon(Icons.access_alarm_rounded),
          label: "In Progress",
        ),
      ]),
    );
  }
}
