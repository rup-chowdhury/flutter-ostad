import 'package:flutter/material.dart';

void main(){
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



