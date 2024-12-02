import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_to_do_app/ui/controllers/cancelled_task_list_controller.dart';
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

  final CancelledTaskListController _cancelledTaskListController =
      Get.find<CancelledTaskListController>();

  @override
  void initState() {
    super.initState();
    _getCanceledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CancelledTaskListController>(builder: (controller) {
      return Visibility(
        visible: !controller.inProgress,
        replacement: const CenteredCircularProgressIndicator(),
        child: RefreshIndicator(
          onRefresh: () async {
            _getCanceledTaskList();
          },
          child: ListView.separated(
            itemCount: controller.taskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: controller.taskList[index],
                onRefreshList: _getCanceledTaskList,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        ),
      );
    });
  }

  Future<void> _getCanceledTaskList() async {
    final bool result = await _cancelledTaskListController.getCancelledTaskList();
    if (result == false) {
      showSnackBarMessage(context, _cancelledTaskListController.errorMessage!, true);
    }
  }
}
