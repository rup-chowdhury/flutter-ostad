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
            body: Row(
              children: [
                Column(
                  children: [
                    Text('Column 1'),
                    Text('Column 1'),
                    Text('Column 1'),
                    Text('Column 1')
                  ],
                ),
                Column(
                  children: [
                    Text('Column 2'),
                    Text('Column 2'),
                    Text('Column 2'),
                    Text('Column 2'),
                    Text('Column 2'),
                    Text('Column 2')
                  ],
                ),
                Column(
                  children: [
                    Text('Column 3'),
                    Text('Column 3'),
                    Text('Column 3'),
                    Text('Column 3')
                  ],
                ),
              ],
            ),
            // body: SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     // crossAxisAlignment: CrossAxisAlignment.center,
            //     //vertically
            //     children: [
            //     Text("Hello "),
            //     Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Hello "),
            //       Text("There "),
            //       Text("Everyone \n is losing \n their \n path"),
            //       ElevatedButton(onPressed: (){
            //       Text("Button Pressed");},
            //           child: Text("Sign In")),
            //       IconButton(onPressed: () {
            //         Text("Alarm");},
            //           icon: Icon(Icons.alarm_add_sharp))
            //   ]
            //   ),
            // )
        )
    );
  }
}