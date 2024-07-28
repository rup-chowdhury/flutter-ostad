import 'package:flutter/material.dart';

//Module 9 Class 1

// Textfield

void main(){
  runApp(six());
}

class six extends StatelessWidget {
  const six({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              enabled: true,
              decoration: InputDecoration(
                label: Text("Name"),
                icon: Icon(Icons.account_circle, size: 45, color: Colors.blueGrey[800],),
                prefixIcon: Icon(Icons.arrow_drop_down_circle_outlined),
                suffixIcon: TextButton(onPressed: () {}, child: Text("Search")),
                hintText: "Enter your name",
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.7)
                ),
                border: OutlineInputBorder(),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2
                    )
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

