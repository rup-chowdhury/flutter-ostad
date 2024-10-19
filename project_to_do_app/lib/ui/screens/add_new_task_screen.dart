import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/widgets/task_manager_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48,),
                Text("Add New Task", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),),
                const SizedBox(height: 24,),
                TextFormField(
                  controller: titleTEController,
                  decoration: const InputDecoration(
                    hintText: "Title"
                  ),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: descriptionTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: "Description"
                  ),
                  validator: (String? value) {
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: (){}, child: const Icon(Icons.arrow_circle_right_outlined))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
