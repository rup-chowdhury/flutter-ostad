import 'package:flutter/material.dart';

// Class name: MediaQuery | Wrap | LayoutBuilder | WidgetBuilder  ( 15 August, 2024)

// Actual topic: Wrap, Mediaquery,
void main() {
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

    if (mediaQueryData.size.width < 640) {
      print("This device is a phone.");
    } else if (mediaQueryData.size.width > 640 &&
        mediaQueryData.size.width < 1008) {
      print("This device is a tablet");
    } else {
      print("This is a Laptop or Desktop");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: OrientationBuilder(builder: (context, Orientation orientation) {
        return Column(
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
            ),
            Text(
              orientation.name,
              style: TextStyle(fontSize: 20),
            )
          ],
        );
      }),
    );
  }
}
