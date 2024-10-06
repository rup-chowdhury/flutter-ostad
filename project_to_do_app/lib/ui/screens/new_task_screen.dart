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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TaskSummaryCard(
                    count: 9,
                    title: "New",
                  ),
                  TaskSummaryCard(
                    count: 9,
                    title: "Completed",
                  ),TaskSummaryCard(
                    count: 9,
                    title: "Cancelled",
                  ),TaskSummaryCard(
                    count: 9,
                    title: "Progress",
                  ),
                ],
              ),
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
    super.key, required this.count, required this.title,
  });

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: SizedBox(
        width: 110,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$count", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 4,),
              Text(title, style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
