import 'package:flutter/material.dart';

// listView, gridView, sizedBox, container
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Intro App',
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> friendList = [
    "Jonayet",
    "Prapty",
    "Alim",
    "Tasin",
    "Promita",
    "Araf",
    "Novel"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blueGrey.shade300,
              child: Icon(Icons.add, size: 60,),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
