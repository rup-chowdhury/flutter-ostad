import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar( 
        title: Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        // child: Icon(Icons.tablet_android, size: 80, color: Colors.white),
      child: Image.asset(
        'assets/img.png',
        width: 250,
        height: 200,
        fit: BoxFit.cover,
      ),
      ),
    );
  }
}

