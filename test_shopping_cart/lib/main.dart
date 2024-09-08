import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pulloverCount = 1;
  int _tshirtCount = 1;
  int _sportDressCount = 1;

  void _incrementCount(String item) {
    setState(() {
      if (item == 'pullover') {
        _pulloverCount++;
      } else if (item == 'tshirt') {
        _tshirtCount++;
      } else if (item == 'sportdress') {
        _sportDressCount++;
      }
    });
  }

  void _decrementCount(String item) {
    setState(() {
      if (item == 'pullover') {
        if (_pulloverCount > 0) {
          _pulloverCount--;
        }
      } else if (item == 'tshirt') {
        if (_tshirtCount > 0) {
          _tshirtCount--;
        }
      } else if (item == 'sportdress') {
        if (_sportDressCount > 0) {
          _sportDressCount--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Pullover Item
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pullover',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Color: Black',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Size: L',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _decrementCount('pullover'),
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text('$_pulloverCount'),
                      IconButton(
                        onPressed: () => _incrementCount('pullover'),
                        icon: Icon(Icons.add_circle_outline),
                      ),
                      SizedBox(width: 16.0),
                      Text('\$51'),
                    ],
                  ),
                ],
              ),
            ),

            // T-Shirt Item
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'T-Shirt',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Color: Gray',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Size: L',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _decrementCount('tshirt'),
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text('$_tshirtCount'),
                      IconButton(
                        onPressed: () => _incrementCount('tshirt'),
                        icon: Icon(Icons.add_circle_outline),
                      ),
                      SizedBox(width: 16.0),
                      Text('\$30'),
                    ],
                  ),
                ],
              ),
            ),

            // Sport Dress Item
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sport Dress',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Color: Black',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Size: M',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _decrementCount('sportdress'),
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text('$_sportDressCount'),
                      IconButton(
                        onPressed: () => _incrementCount('sportdress'),
                        icon: Icon(Icons.add_circle_outline),
                      ),
                      SizedBox(width: 16.0),
                      Text('\$43'),
                    ],
                  ),
                ],
              ),
            ),

            // Total Amount
            SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$124',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Checkout Button
            SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle checkout logic
                  print('Checkout button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('CHECK OUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}