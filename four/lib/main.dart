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
  List<String> friendList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blueAccent,
        ),

        // body: ListView.builder(
        //   itemCount: 1000,
        //   itemBuilder: (context, index) {
        //     return SizedBox(
        //       width: 100,
        //       height: 100,
        //       child: Center(
        //           child: Text((index+1).toString())),
        //     );
        //   },
        // )
    );;
  }
}


