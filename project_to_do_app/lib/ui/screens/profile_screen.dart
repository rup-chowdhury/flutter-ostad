import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/widgets/task_manager_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(isProfileScreenOpen: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48,),
              Text(
                "Get Started With",
                style: Theme.of(context).textTheme.displaySmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16,),
              _buildPhotoPicker(),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email"
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "First Name"
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Last Name"
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Phone"
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Password"
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: const Icon(Icons.arrow_circle_right_outlined))
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPhotoPicker(){
    return Container();
  }
}
