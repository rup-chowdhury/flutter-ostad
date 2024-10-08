import 'package:flutter/material.dart';

void main(){
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      // Debug banner removed
      home: Home(),
      title: "Intro App",
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
        
        // child: GestureDetector(
        //   onTap: () {
        //     print("Bangladesh Flag");
        //   },
        //   child: Image.asset('assets/img_1.png',
        //   width: 300,
        //   height: 240,
        //   fit: BoxFit.cover,),
        // ),
        // child: ElevatedButton(
        //   onPressed: () {
        //     print("Button Pressed");
        //     },
        //   child: Text("Notification"),
        // ),

        // child: IconButton(
        //   onPressed: () {
        //     print("Added");
        //   }, icon: Icon(Icons.add_a_photo,
        //   size: 80,),
        // ),

        // child: TextButton(onPressed: () {
        //   print("Entered");
        // },
        //   child: Text("Enter"),
        // ),

        child: InkWell(
            onTap: () {
              print("Text tapped");
            },
            child: Text("Just Text")
        ),
      ),
    );
  }
}



