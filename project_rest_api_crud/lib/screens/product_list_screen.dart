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
            title: const Text("Product Name"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Product Code: code"),
                const Text("Price: \$120"),
                const Text("Quantity: 2"),
                const Text("Total Price: \$240"),
                const Divider(),
                ButtonBar(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
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
