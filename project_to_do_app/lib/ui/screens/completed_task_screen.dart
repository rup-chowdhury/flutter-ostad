import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_to_do_app/ui/controllers/completed_task_list_controller.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';
import 'package:project_to_do_app/ui/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  static const String name = '/completedTaskScreen';

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  final CompletedTaskListController _completedTaskListController =
    Get.find<CompletedTaskListController>();

  @override
  void initState() {
    super.initState();
    _getCompleteTaskList();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompletedTaskListController>(
      builder: (controller) {
        return Visibility(
          visible: !controller.inProgress,
          replacement: const CenteredCircularProgressIndicator(),
          child: RefreshIndicator(
            onRefresh: () async {
              _getCompleteTaskList();
            },
            child: ListView.separated(
              itemCount: controller.taskList.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: controller.taskList[index],
                  onRefreshList: _getCompleteTaskList,
                );
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

  Future<void> _getCompleteTaskList() async {
    final bool result = await _completedTaskListController.getCompletedTaskList();
    if(result == false) {
      showSnackBarMessage(context, _completedTaskListController.errorMessage!, true);
    }
  }
}
