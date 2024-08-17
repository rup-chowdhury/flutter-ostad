import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Profile"),
        leading: Icon(CupertinoIcons.back),
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is Cupertino design"),
              SizedBox(
                height: 20,
              ),
              Icon(CupertinoIcons.airplane, size: 50,),
              SizedBox(
                height: 20,
              ),
              CupertinoButton.filled(child: Text("Press"), onPressed: (){})
            ],
          ),
        ));
  }
}
