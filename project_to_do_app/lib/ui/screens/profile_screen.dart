import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/widgets/task_manager_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TMAppBar(isProfileScreenOpen: true,),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}
