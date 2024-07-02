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
          child: Text("Hello There. You are too short for your reputation",
            textAlign: TextAlign.start,
            style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            decoration: TextDecoration.overline,
            letterSpacing: 1,
            wordSpacing: 10
          ),
          ),
        ),
      ),
    );
  }

}


