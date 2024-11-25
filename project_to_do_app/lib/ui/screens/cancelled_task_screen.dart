import 'package:flutter/material.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/models/task_list_model.dart';
import 'package:project_to_do_app/data/models/task_model.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';
import 'package:project_to_do_app/ui/widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  static const String name = '/cancelledTaskScreen';

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _getCanceledTaskListInProgress = false;
  List<TaskModel> _canceledTaskList =  [];

  @override
  void initState() {
    super.initState();
    _getCanceledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_getCanceledTaskListInProgress,
      replacement: const CenteredCircularProgressIndicator(),
      child: RefreshIndicator(
        onRefresh: () async {
          _getCanceledTaskList();
        },
        child: ListView.separated(
          itemCount: _canceledTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskModel: _canceledTaskList[index],
              onRefreshList: _getCanceledTaskList,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8,);
          },
        ),
      ),
    );
  }

  Future<void> _getCanceledTaskList() async {
    _canceledTaskList.clear();
    _getCanceledTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.canceledTaskList);
    if(response.isSuccess) {
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _canceledTaskList = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
      print(response.errorMessage);
    }
    _getCanceledTaskListInProgress = false;
    setState(() {});
  }
}
