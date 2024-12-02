import 'package:get/get.dart';
import 'package:project_to_do_app/data/models/task_model.dart';

class CompletedTaskListController extends GetxController{
  bool _inProgress = false;

  String? _errorMessage;

  List<TaskModel> _taskList = [];

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<TaskModel> get taskList => _taskList;
}