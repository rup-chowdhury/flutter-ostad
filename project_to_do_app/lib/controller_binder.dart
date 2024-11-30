import 'package:get/get.dart';
import 'package:project_to_do_app/ui/controllers/new_task_list_controller.dart';
import 'package:project_to_do_app/ui/controllers/sign_in_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(NewTaskListController());
  }

}