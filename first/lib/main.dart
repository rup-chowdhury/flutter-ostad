import 'package:flutter/material.dart';

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home of Ruplaal"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Text("Hello Ostad Rup"),
        ),
      ),
    );
  }

}


