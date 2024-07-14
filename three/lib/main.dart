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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              //vertically
              children: [
              Text("Hello"),
              Text("There"),
                Text("Everyone"),
                ElevatedButton(onPressed: (){
                Text("Button Pressed");},
                    child: Text("Sign In")),
                IconButton(onPressed: () {
                  Text("Alarm");},
                    icon: Icon(Icons.alarm_add_sharp))
            ]
            )
        )
    );
  }
}