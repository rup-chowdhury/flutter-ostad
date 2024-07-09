import 'package:flutter/material.dart';

void main() {
  runApp(homeApp());
}

class homeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Text("Home Page"),
            ),
            body: Center(
              child: Text("Hello World"),
            )
        )
    );
  }
}