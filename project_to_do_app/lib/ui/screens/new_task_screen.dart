import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/add_new_task_screen.dart';
import 'package:project_to_do_app/ui/widgets/task_card.dart';
import 'package:project_to_do_app/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskListInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
            return const TaskCard();
          },
          separatorBuilder: (context, index) {
                return const SizedBox(height: 8,);
          },),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  Padding _buildSummarySection() {
    return const Padding(
          padding: EdgeInsets.all(8.0),
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
        );
  }

  void _onTapAddFAB(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen()));
  }

  Future<void> _getNewTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});

  }
}



