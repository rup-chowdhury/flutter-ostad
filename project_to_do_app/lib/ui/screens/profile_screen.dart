import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/data/models/user_model.dart';
import 'package:project_to_do_app/data/services/network_caller.dart';
import 'package:project_to_do_app/data/utils/urls.dart';
import 'package:project_to_do_app/ui/controllers/auth_controller.dart';
import 'package:project_to_do_app/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:project_to_do_app/ui/widgets/snack_bar_message.dart';
import 'package:project_to_do_app/ui/widgets/task_manager_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  // final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? selectedImage;

  bool _updateProfileInProgress = false;

  @override
  void initState() {
    super.initState();
    _setUserData();
  }

  void _setUserData() {
    _emailTEController.text = AuthController.userData?.email ?? '';
    _firstNameTEController.text = AuthController.userData?.firstName ?? '';
    _lastNameTEController.text = AuthController.userData?.lastName ?? '';
    _phoneTEController.text = AuthController.userData?.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(isProfileScreenOpen: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48,),
                Text(
                  "Get Started With",
                  style: Theme.of(context).textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 32,),
                _buildPhotoPicker(),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _emailTEController,
                  enabled: false,
                  decoration: const InputDecoration(
                    hintText: "Email"
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                      hintText: "First Name"
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                      hintText: "Last Name"
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _phoneTEController,
                  decoration: const InputDecoration(
                      hintText: "Phone"
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) {
                      return 'Enter you phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(
                      hintText: "Password"
                  ),
                ),
                const SizedBox(height: 16,),
                Visibility(
                  visible: !_updateProfileInProgress,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()) {
                    _updateProfile();
                    }
                  }, child: const Icon(Icons.arrow_circle_right_outlined)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    _updateProfileInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _phoneTEController.text.trim(),
    };
    if (_passwordTEController.text.isNotEmpty) {
      requestBody['password'] = _passwordTEController.text;
    }
    if(selectedImage != null) {
      List<int> imageBytes = await selectedImage!.readAsBytes();
      String convertedImage = base64Encode(imageBytes);
      requestBody['photo'] = convertedImage;
    }

    final NetworkResponse response = await NetworkCaller.postRequest(url: Urls.updateProfile, body: requestBody);

    _updateProfileInProgress = false;
    setState(() {});

    if(response.isSuccess) {
      UserModel userModel = UserModel.fromJson(requestBody);
      AuthController.saveUserData(userModel);
      showSnackBarMessage(context, 'Profile has been updated!');
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }

  }

  Widget _buildPhotoPicker(){
    return GestureDetector(
      onTap: _selectImage,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: const Text("Photo", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),),
            ),
            const SizedBox(width: 8,),
            Text(_getSelectedPhotoTitle()),
          ],
        ),
      ),
    );
  }

  String _getSelectedPhotoTitle() {
    if(selectedImage != null) {
      return selectedImage!.name;
    }
    return 'Select Photo';
  }

  Future<void> _selectImage() async{
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      selectedImage = pickedImage;
      setState(() {});
    }
  }
}

//TODO : needs to restart the app to show the change in the update profile

