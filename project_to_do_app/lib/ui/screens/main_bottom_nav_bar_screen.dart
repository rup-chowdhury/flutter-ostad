import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/cancelled_task_screen.dart';
import 'package:project_to_do_app/ui/screens/completed_task_screen.dart';
import 'package:project_to_do_app/ui/screens/new_task_screen.dart';
import 'package:project_to_do_app/ui/screens/progress_task_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/utils/assets_path.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.themeColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rup Chowdhury",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "rupbd1@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            _selectedIndex = index;
            setState(() {});
          },
          destinations: const [
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
