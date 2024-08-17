// Current SDK version: 3.22.1
import 'package:flutter/material.dart';
import 'package:seven/home.dart';

// TextField

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Intro app',
    );
  }
}


