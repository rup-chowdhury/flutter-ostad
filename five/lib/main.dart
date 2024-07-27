import 'package:flutter/material.dart';

//margin, padding, decoration

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
              margin: EdgeInsets.all(14),
              decoration: BoxDecoration(
              color: Colors.greenAccent,
                border: Border.all(
                color: Colors.blueGrey,
                width: 5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/R.jpeg'),
                  fit: BoxFit.fill,
                  opacity: 1,

                )
              ),
              alignment: Alignment.center,
              child: Text("Container 1",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 5,
                ),
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(25),
                //   bottomLeft: Radius.circular(25)
                // )
                shape: BoxShape.circle
              ),
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


