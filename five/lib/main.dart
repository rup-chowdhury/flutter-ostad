import 'package:flutter/material.dart';

//margin, padding, decoration, boxShadow

void main() {
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
  List<String> friendList = [
    "Rahim",
    "Karim",
    "Alu",
    "Tasin",
    "Alim",
    "Tomato"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Day after freedom"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(color: Colors.blueGrey, width: 5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/R.jpeg'),
                    fit: BoxFit.fill,
                    opacity: 1,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(4, 6))
                  ]),
              alignment: Alignment.center,
              child: Text(
                "Container 1",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.only(bottom: 15),
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
                  shape: BoxShape.circle),
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

                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.grey.withOpacity(0.7),
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text(
                              "This is our custom dialog. Adding some extra text to make it larger."),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "[Demo text for Column] You can complete your payment in 3 different methods :"),
                              Text("1. Bkash"),
                              Text("2. Nagad"),
                              Text("3. Rocket"),
                            ],
                          ),
                          actions: [
                            TextButton(onPressed: () {}, child: Text("Send")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"))
                          ],
                          shape: RoundedRectangleBorder(
                              // borderRadius: BorderRadius.zero,
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: Colors.white,
                        );
                      });
                },
                child: Text("Dialog Button")),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.7),
                      enableDrag: false,
                      builder: (ctx) {
                        return SizedBox(
                          height: 270,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Title",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "This is a demo text for the bottom sheet. The everyday elements we use in our life - "),
                                    Text("1. Paper"),
                                    Text("2. Pen"),
                                    Text("3. Water"),
                                    Text("4. Bottle"),
                                    Text("5. Laptop"),
                                    Text("6. Android Studio")
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text("Show bottom sheet"))
          ],
        ),
      ),
    );
  }
}
