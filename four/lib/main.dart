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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),

      body: SizedBox(
        width: 130,
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Center(
                  child: Text("Box 1")),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Center(
                  child: Text("Box 2")),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Center(
                  child: Text("Box 3")),
            )
          ],
        ),
      ),
    );
  }
}


