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
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        // child: Icon(
        //   Icons.android_sharp,
        //   size: 90,
        //   color: Colors.red,
        // ),
        
        child: Image.asset('assets/img_1.png',
        width: 300,
        height: 240,
        fit: BoxFit.cover,),
      ),
    );
  }
}



