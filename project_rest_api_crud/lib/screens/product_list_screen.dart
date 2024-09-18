import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Text("Product Name"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Code: code"),
                Text("Price: \$120"),
                Text("Quantity: 2"),
                Text("Total Price: \$240"),
                ButtonBar(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: 
                      ),
                      label: Text("Edit", style: TextStyle(
                        color: Colors.blue
                      ),),
                      icon: Icon(Icons.edit, color: Colors.blue,),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text("Delete", style: TextStyle(
                        color: Colors.red
                      ),),
                      icon: Icon(Icons.delete, color: Colors.red,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
