import 'package:flutter/material.dart';

void main() {
  runApp();
}

class IntroApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    )
  }

}


