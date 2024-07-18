import 'package:flutter/material.dart';

// listView, gridView, sizedBox, container

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Intro App',
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> friendList = ["Jonayet", "Prapty", "Alim", "Tasin", "Promita", "Araf", "Novel"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blueAccent,
        ),
        
        body: ListView.separated(
            itemCount: friendList.length,
            itemBuilder: (context, index) {
              return ListTile(
                  tileColor: Colors.white70,
                  title: Text(friendList[index]),
                  subtitle: Text("Close Friend"),
                  leading: Text((index+1).toString()),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          Icons.circle_rounded,
                          size: 15,
                          color: Colors.greenAccent,),
                      Text("Active")
                    ],
                  ),
                  onTap: () {
                    print(friendList[index]);
                    },
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
                subtitleTextStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 12
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 30,
                color: Colors.grey.shade200,
                thickness: 2,
                indent: 8,
                endIndent: 17,
              );
        },),

        // body: ListView.builder(
        //   itemCount: 1000,
        //   itemBuilder: (context, index) {
        //     return SizedBox(
        //       width: 100,
        //       height: 100,
        //       child: Center(
        //           child: Text((index+1).toString())),
        //     );
        //   },
        // )
      
        // body: GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 3,
        //         crossAxisSpacing: 8,
        //         mainAxisSpacing: 8,
        //         childAspectRatio: 0.5),
        //     itemCount: friendList.length,
        //     itemBuilder: (context, index){
        //        return Column(
        //          children: [
        //            Text(index.toString()),
        //            Text(friendList[index]),
        //          ],
        //        );
        //     }),
    );;
  }
}


