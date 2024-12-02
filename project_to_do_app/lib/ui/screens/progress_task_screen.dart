import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_to_do_app/ui/controllers/progress_task_list_controller.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/task_card.dart';

import '../widgets/snack_bar_message.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  static const String name = '/progressTaskScreen';

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  final ProgressTaskListController _progressTaskListController =
    Get.find<ProgressTaskListController>();

  @override
  void initState() {
    super.initState();
    _getProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgressTaskListController>(
      builder: (controller) {
        return Visibility(
          visible: !controller.inProgress,
          replacement: const CenteredCircularProgressIndicator(),
          child: RefreshIndicator(
            onRefresh: () async {
              _getProgressTaskList();
            },
            child: ListView.separated(
              itemCount: controller.taskList.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: controller.taskList[index],
                  onRefreshList: _getProgressTaskList);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8,);
              },
            ),
          ),
        );
      }
    );
  }

  Future<void> _getProgressTaskList() async {
    final bool result = await _progressTaskListController.getProgressTaskList();
    if(result == false) {
      showSnackBarMessage(context, _progressTaskListController.errorMessage!, true);
    }
  }
}
