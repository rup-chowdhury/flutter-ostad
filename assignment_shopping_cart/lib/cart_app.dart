import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _pullOverCounter = 0;
  final int _pullOverPrice = 51;

  int _tShirtCounter = 0;
  final int _tShirtPrice = 30;

  int _sportDressCounter = 0;
  final int _sportDressPrice = 43;

  int _total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Text(
          "My Bag",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(top: 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/images/img_pull_over.png',
                      height: 85,
                      width: 85,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pullover",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Color: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            Text(
                              "Black",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Size: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            Text(
                              "L",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (_pullOverCounter >= 1) {
                                    _pullOverCounter--;
                                  }
                                  setState(() {
                                    _total = (_pullOverPrice*_pullOverCounter)+(_tShirtPrice*_tShirtCounter)+(_sportDressPrice*_sportDressCounter);
                                  });
                                },
                                icon: Icon(Icons.remove_circle_outline)),
                            Text(
                              "$_pullOverCounter",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                            IconButton(
                                onPressed: () {
                                  _pullOverCounter++;
                                  setState(() {
                                    _total = (_pullOverPrice*_pullOverCounter)+(_tShirtPrice*_tShirtCounter)+(_sportDressPrice*_sportDressCounter);
                                  });
                                },
                                icon: Icon(Icons.add_circle_outline))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.more_vert),
                          Text(
                            "$_pullOverPrice\$",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(top: 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/images/img_t_shirt.png',
                      height: 85,
                      width: 85,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "T Shirt",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Color: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            Text(
                              "Black",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Size: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            Text(
                              "L",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (_tShirtCounter >= 1) {
                                    _tShirtCounter--;
                                  }
                                  setState(() {
                                    _total = (_pullOverPrice*_pullOverCounter)+(_tShirtPrice*_tShirtCounter)+(_sportDressPrice*_sportDressCounter);
                                  });
                                },
                                icon: Icon(Icons.remove_circle_outline)),
                            Text(
                              "$_tShirtCounter",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                            IconButton(
                                onPressed: () {
                                  _tShirtCounter++;
                                  setState(() {
                                    _total = (_pullOverPrice*_pullOverCounter)+(_tShirtPrice*_tShirtCounter)+(_sportDressPrice*_sportDressCounter);
                                  });
                                },
                                icon: Icon(Icons.add_circle_outline))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.more_vert),
                          Text(
                            "$_tShirtPrice\$",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(top: 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/images/img_sport_dress.png',
                      height: 85,
                      width: 85,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sport Dress",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Color: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            Text(
                              "Black",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Size: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            Text(
                              "L",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (_sportDressCounter >= 1) {
                                    _sportDressCounter--;
                                  }
                                  setState(() {
                                    _total = (_pullOverPrice*_pullOverCounter)+(_tShirtPrice*_tShirtCounter)+(_sportDressPrice*_sportDressCounter);
                                  });
                                },
                                icon: Icon(Icons.remove_circle_outline)),
                            Text(
                              "$_sportDressCounter",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                            IconButton(
                                onPressed: () {
                                  _sportDressCounter++;
                                  setState(() {
                                    _total = (_pullOverPrice*_pullOverCounter)+(_tShirtPrice*_tShirtCounter)+(_sportDressPrice*_sportDressCounter);
                                  });
                                },
                                icon: Icon(Icons.add_circle_outline))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.more_vert),
                          Text(
                            "$_sportDressPrice\$",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total amount : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),),
                        Text("$_total\$", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){

                    final snackBar = SnackBar(
                        content: Text("Congratulations! Check Out Successful"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }, child: Text("CHECK OUT", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),), style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    foregroundColor: Colors.white
                  ),)
                ],
              ),
        ],
      ),
    );
  }
}


