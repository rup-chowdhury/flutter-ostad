import 'package:flutter/material.dart';


// Single child, Multiple children

//Column, row

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
            body: Column(
              children: [
              Text("Hello"),
              Text("There"),
            ]
            )
        )
    );
  }
}