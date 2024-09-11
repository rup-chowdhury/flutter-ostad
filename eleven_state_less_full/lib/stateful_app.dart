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
      )
    );
  }
}
