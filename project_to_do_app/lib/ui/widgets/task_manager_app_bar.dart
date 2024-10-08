import 'package:flutter/material.dart';
import 'package:project_to_do_app/ui/screens/sign_in_screen.dart';
import 'package:project_to_do_app/ui/utils/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: AppBar(
        backgroundColor: AppColor.themeColor,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rup Chowdhury",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "rupbd1@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen()), (_) => false);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

