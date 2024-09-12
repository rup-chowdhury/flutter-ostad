import 'package:flutter/material.dart';

class StatefulApp extends StatefulWidget {
  StatefulApp({super.key});

  @override
  State<StatefulApp> createState() => _StatefulAppState();
}

class _StatefulAppState extends State<StatefulApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless and Stateful", style: TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
          fontSize: 27
        ),),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("The button was tapped $counter times", style: TextStyle(
              fontSize: 21
            ),),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              counter++;
              print(counter);
            });
      }),

    );
  }
}
