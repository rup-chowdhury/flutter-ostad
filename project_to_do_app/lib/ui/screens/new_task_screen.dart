import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/add_new_task_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/task_summary_card.dart';

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
          _buildSummarySection(),
          Expanded(child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
            return TaskCard();
          },
          separatorBuilder: (context, index) {
                return const SizedBox(height: 8,);
          },))
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
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title of the Task", style: Theme.of(context).textTheme.titleSmall,),
            const Text("Description of task",),
            const Text("Date: 20/10/2024",),
            const SizedBox(height: 8,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text(
                    "New", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),), shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(
                    color: AppColor.themeColor
                  )
                ),),
                Wrap(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

