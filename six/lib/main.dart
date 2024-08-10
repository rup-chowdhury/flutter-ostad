import 'package:flutter/material.dart';

//Module 9 Class 1

// Textfield

void main() {
  runApp(six());
}

class six extends StatelessWidget {
  const six({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 4
          )
        ),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(
        //     foregroundColor: Colors.amber,
        //     textStyle: TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.w700
        //     )
        //   )
        // ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue, width: 2)),
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.white, width: 2)),
          )
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _descriptionTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                enabled: true,
                decoration: InputDecoration(
                  label: Text("Name"),
                  labelStyle: TextStyle(letterSpacing: 2),
                  icon: Icon(
                    Icons.account_circle,
                    size: 45,
                    color: Colors.blueGrey[800],
                  ),
                  prefixIcon: Icon(Icons.arrow_drop_down_circle_outlined),
                  // suffixIcon: TextButton(onPressed: () {}, child: Text("Search")),
                  hintText: "Enter your name",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _descriptionTEC,
                enabled: true,
                maxLines: 5,
                maxLength: 200,
                onTap: () {
                  print("Tapped on Description");
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  label: Text("Description"),
                  labelStyle: TextStyle(letterSpacing: 2, fontSize: 16),
                  alignLabelWithHint: true,
                  hintText: "Enter your description",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                enabled: true,
                onChanged: (String value) {
                  print(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  labelStyle: TextStyle(letterSpacing: 2, fontSize: 16),
                  alignLabelWithHint: true,
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                ),
              ),
              TextButton(onPressed: () {
                _descriptionTEC.clear();
              },
                  child: Text("Clear Description"))
            ],
          ),
        ),
      ),
    );
  }
}
