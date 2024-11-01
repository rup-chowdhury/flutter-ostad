import 'package:flutter/material.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/models/task_model.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.onRefreshList,
  });

  final TaskModel taskModel;
  final VoidCallback onRefreshList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  String _selectedStatus = '';
  bool _changeStatusInProgress = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.taskModel.status!;
  }


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
            Text(
              widget.taskModel.title ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              widget.taskModel.description ?? '',
            ),
            Text(
              "Date: ${widget.taskModel.createdDate ?? ''}",
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    IconButton(
                        onPressed: _onTapEditButton,
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: _onTapDeleteButton,
                        icon: const Icon(Icons.delete)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapEditButton() {
    print(_selectedStatus);
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Edit Status"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['New', 'Completed', 'Cancelled', 'Progress'].map((e){
            return ListTile(
              onTap: (){
                _changeStatus(e);
                Navigator.pop(context);
              },
            title: Text(e),
              selected: _selectedStatus == e,
              trailing: _selectedStatus == e ? const Icon(Icons.check) : null,
            );
      }).toList(),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
        ],
      );
    });
  }

  void _onTapDeleteButton() {}

  Widget _buildTaskStatusChip() {
    return Chip(
      label: const Text(
        "New",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColor.themeColor)),
    );
  }

  Future<void> _changeStatus(String newStatus) async {
    _changeStatusInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.changeTaskStatus(widget.taskModel.sId!, newStatus));

    if(response.isSuccess){
      widget.onRefreshList();
    }else{
      _changeStatusInProgress = false;
      setState(() {});
      showSnackBarMessage(context, response.errorMessage);
    }
  }
}
