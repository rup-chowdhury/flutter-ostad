import 'package:flutter/material.dart';

class StatefulApp extends StatelessWidget {
  const StatefulApp({super.key});

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

            Text("The button was tapped \$x times", style: TextStyle(
              fontSize: 21
            ),),
            
            FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){})
          ],
        ),
      ),

    );
  }
}
