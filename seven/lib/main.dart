// Current SDK version: 3.22.1
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven/home.dart';
import 'package:seven/profile_page.dart';

// TextField

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
      title: 'Intro app',
    );
  }
}


