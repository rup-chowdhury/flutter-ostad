import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        // return const TaskCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8,);
      },
    );
  }
}
