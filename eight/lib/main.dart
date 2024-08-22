import 'package:flutter/material.dart';


// Actual topic: Wrap, Mediaquery,
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery

    MediaQueryData mediaQueryData = MediaQuery.of(context);

    print(mediaQueryData);
    print(mediaQueryData.size);
    print(mediaQueryData.size.width);
    print(mediaQueryData.size.height);
    print(mediaQueryData.size.aspectRatio);
    print(mediaQueryData.size.longestSide);
    print(mediaQueryData.size.flipped.width);



    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 20,
            children: [
              Text("hello you"),
              Text("hello uioweydw erasfds"),
              Text("hello wue edfasdf"),
              Text("hello asydga erwadfa")
            ],
          )
        ],
      ),
    );
  }
}

