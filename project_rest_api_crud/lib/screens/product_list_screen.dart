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
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: ProductItem(),
            );
          }),
    );
  }
}


