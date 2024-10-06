import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TaskSummaryCard()
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddFAB(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen()));
  }
}

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("09", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
              Text("New", style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
