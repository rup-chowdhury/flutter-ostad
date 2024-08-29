import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
// Topic Name : Aspect Ratio | Expanded | FractionallySizedBox

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellowAccent,
      ),
    );
  }
}
