// Current SDK version: 3.22.1
import 'package:flutter/material.dart';

// TextField

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
      title: 'Intro app',
      theme: ThemeData(
          brightness: Brightness.dark ,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.pink,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2
              )
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  )
              )
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.green,
                    width: 2
                )
            ),
            alignLabelWithHint: true,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.green,
                    width: 2
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2
                )
            ),
            labelStyle: TextStyle(
                fontSize: 16
            ),
            hintStyle: TextStyle(
                color: Colors.purple.shade200
            ),
          ),
        textTheme: TextTheme(
            bodySmall: TextStyle(
              fontSize: 18
            ))
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.green,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2
              )
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  )
              )
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.white,
                    width: 2
                )
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.green,
                    width: 2
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2
                )
            ),
            labelStyle: TextStyle(
                fontSize: 16
            ),
            hintStyle: TextStyle(
                color: Colors.purple.shade200
            ),
          ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 16
          ),
          titleLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700
          ),
          titleMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600
          ),
          titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        )
      ),
      themeMode: ThemeMode.system,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _descriptionTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.bodySmall,),
        // backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                enabled: true,
                decoration: InputDecoration(
                  label: Text('Name'),
                  labelStyle: TextStyle(
                      fontSize: 16
                  ),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                      color: Colors.green.shade200,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                  icon: Icon(Icons.add),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: TextButton(
                    child: Text('Search'),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      )
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2
                      )
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionTEController,
                enabled: true,
                maxLines: 5,
                maxLength: 200,
                onTap: () {
                  print('Tapped on textfield');
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  label: Text('Description'),
                  labelStyle: TextStyle(
                      fontSize: 16,
                  ),
                  hintText: 'Enter your description',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                enabled: true,
                onChanged: (String value) {
                  print(value);
                },
                obscureText: true,
                controller: TextEditingController(),
                decoration: InputDecoration(
                  label: Text('Password'),
                  labelStyle: TextStyle(
                      fontSize: 16
                  ),
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(height: 16),
              TextButton(onPressed: () {
                // _descriptionTEController.text = 'clear';
                _descriptionTEController.clear();
              }, child: Text('Clear description', style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.green,
                letterSpacing: 4
              ),))
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings'),
      ),
    );
  }
}
