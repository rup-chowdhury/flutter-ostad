import 'package:flutter/material.dart';

//margin, padding

void main(){
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: "Intro App",
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> friendList = ["Rahim", "Karim", "Alu", "Tasin", "Alim", "Tomato"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: Text("Day after fredom"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.greenAccent,
              margin: EdgeInsets.all(14),
              alignment: Alignment.center,
              child: Text("Container 1"),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.greenAccent,
              margin: EdgeInsets.all(14),
              alignment: Alignment.center,
              child: Text("Container 2"),

            ),
            Padding(
                padding: EdgeInsets.all(24.0),
                child: Text("Hello World"),
            )
          ],
        ),
      ),
    );
  }
}


