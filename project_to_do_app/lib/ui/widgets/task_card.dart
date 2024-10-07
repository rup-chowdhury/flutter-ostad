import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
                _buildTaskStatusChip(),
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

  void _onTapEditButton(){

  }

  void _onTapDeleteButton(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Edit Status"),
        actions: [
          ElevatedButton(onPressed: (){
          }, child: Text("Cancel")),
          ElevatedButton(onPressed: (){
          }, child: Text("Ok")),

        ],
      );
    });
  }

  Widget _buildTaskStatusChip() {
    return Chip(
                label: const Text(
                  "New", style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),), shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(
                      color: AppColor.themeColor
                  )
              ),);
  }
}