import 'package:flutter/material.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/models/task_list_model.dart';
import 'package:project_to_do_app/data/models/task_model.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';
import 'package:project_to_do_app/ui/widgets/task_card.dart';

import '../../data/utils/urls.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool _getCompleteTaskListInProgress = false;
  List<TaskModel> _completedTaskList =  [];

  @override
  void initState() {
    super.initState();
    _getCompleteTaskList();
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_getCompleteTaskListInProgress,
      replacement: const CenteredCircularProgressIndicator(),
      child: RefreshIndicator(
        onRefresh: () async {
          _getCompleteTaskList();
        },
        child: ListView.separated(
          itemCount: _completedTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskModel: _completedTaskList[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8,);
          },
        ),
      ),
    );
  }

  Future<void> _getCompleteTaskList() async {
    _completedTaskList.clear();
    _getCompleteTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.completedTaskList);
    if(response.isSuccess) {
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _completedTaskList = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
      print(response.errorMessage);
    }
    _getCompleteTaskListInProgress = false;
    setState(() {});
  }
}
