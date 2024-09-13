import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cheap Calculator")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNumTEController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "First Number",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.transparent.withOpacity(0.7)
                ),
                labelText: "First Number"
              ),
            ),
            TextField(
              controller: _secondNumTEController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Second Number",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.transparent.withOpacity(0.7)
                  ),
                  labelText: "Second Number"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
