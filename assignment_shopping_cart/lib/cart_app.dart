import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          "My Bag",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/images/img_pull_over.png',
                  height: 80,
                  width: 80,
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
                        IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline)),
                        Text("Quantity", style: TextStyle(fontSize: 12),textAlign: TextAlign.start,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline))
                      ],
                    )
                  ],
                ),

                SizedBox(width: 80,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.more_vert),
                    Text("51\$", style: TextStyle(fontWeight: FontWeight.bold),)],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
