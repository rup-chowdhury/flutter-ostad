import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          // Flexible(
          //   flex: 2,
          //   child: Container(
          //     color: Colors.blue,
          //     width: 100,
          //   ),
          // ),
          // Flexible(
          //   flex: 3,
          //   child: Container(
          //     color: Colors.greenAccent,
          //     width: 200,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     color: Colors.yellow,
          //     height: 100,
          //     width: 100,
          //   ),
          // )
          AspectRatio(
            aspectRatio: 1.25,
            child: Container(
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
