import 'package:flutter/material.dart';
import 'package:project_rest_api_crud/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: ProductItem(),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
      child: const Icon(Icons.add),backgroundColor: Colors.blueGrey[200],),
    );
  }
}


