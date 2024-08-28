import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

// Class name: MediaQuery | Wrap | LayoutBuilder | WidgetBuilder  ( 15 August, 2024)

// Actual topic: Wrap, Mediaquery,
void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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

    // print(mediaQueryData);
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
      body: OrientationBuilder(
          builder: (context, Orientation orientation) {
        print(orientation.name);

        if (orientation == Orientation.portrait) {
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
        }
        else {
          return Center(
            child: Text("Too Big Screen"),
          );
        }
      }
      ),
    );
  }
}
