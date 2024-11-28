import 'package:flutter/material.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';
import 'package:project_to_do_app/ui/widgets/task_manager_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/addNewTaskScreen';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewTaskInProgress = false;
  bool _shouldRefreshPreviousPage = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        Navigator.pop(context, _shouldRefreshPreviousPage);
      },
      child: Scaffold(
        appBar: const TMAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    "Add New Task",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: titleTEController,
                    decoration: const InputDecoration(hintText: "Title"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: descriptionTEController,
                    maxLines: 5,
                    decoration: const InputDecoration(hintText: "Description"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: !_addNewTaskInProgress,
                    replacement: const CircularProgressIndicator(),
                    child: ElevatedButton(
                        onPressed: _onTapSubmitButton,
                        child: const Icon(Icons.arrow_circle_right_outlined)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _addNewTask();
    }
  }


  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    Map<String, dynamic> requestBody = {
      "title": titleTEController.text.trim(),
      "description": descriptionTEController.text.trim(),
      "status": "New"
    };


    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.addNewTaskUrl, body: requestBody);
    _addNewTaskInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      _shouldRefreshPreviousPage = true;
      _clearTextFields();
      showSnackBarMessage(context, 'New Task Added');
      // Navigator.pop(context);
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  
  void _clearTextFields() {
    titleTEController.clear();
    descriptionTEController.clear();
  }

  @override
  void dispose() {
    titleTEController.dispose();
    descriptionTEController.dispose();
    super.dispose();
  }
}
