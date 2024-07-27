import 'package:flutter/material.dart';

//margin, padding, decoration, boxShadow

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
      backgroundColor: Colors.white70,
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
                ),
                boxShadow: <BoxShadow> [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(4, 6)
                  )
                ]
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
              padding: EdgeInsets.only(
                bottom: 15
              ),
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
            ),
            ElevatedButton(
                onPressed: () {
                  // showAboutDialog(
                  //   context: context,
                  //   applicationName: "App Dialog",
                  //   applicationVersion: "1.0.0",
                  //   applicationIcon: Icon(Icons.book_outlined),
                  //   children: [
                  //     Text("This text is shown in the dialog bar. It is a demo text.")
                  //   ]
                  // );

                showDialog(context: context, builder: (ctx) {
                  return AlertDialog(
                    title: Text("This is our custom dialog. Adding some extra text to make it larger."),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("[Demo text for Column] You can complete your payment in 3 different methods :"),
                        Text("1. Bkash"),
                        Text("2. Nagad"),
                        Text("3. Rocket"),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: () {}, child: Text("Send")),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                        },
                          child: Text("Cancel")
                      )
                    ],
                    shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.zero,
                      borderRadius: BorderRadius.circular(0.0)
                    ),
                  );
                });
                },
                child: Text("Dialog Button"))
          ],
        ),
      ),
    );
  }
}


