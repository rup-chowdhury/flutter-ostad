import 'package:flutter/material.dart';
import 'package:project_sample_bank_management/Screens/home_screen.dart';

class BankManagementApp extends StatelessWidget {
  const BankManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
