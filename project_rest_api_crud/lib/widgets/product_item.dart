import 'package:flutter/material.dart';
import 'package:project_rest_api_crud/models/product.dart';
import 'package:project_rest_api_crud/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(product.productName),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: ${product.productCode}"),
          Text("Price: ${product.unitPrice}"),
          Text("Quantity: ${product.quantity}"),
          Text("Total Price: ${product.totalPrice}"),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const UpdateProductScreen();
                  }),
                  );
                },
                label: const Text("Edit", style: TextStyle(
                    color: Colors.blue
                ),),
                icon: const Icon(Icons.edit, color: Colors.blue,),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text("Delete", style: TextStyle(
                    color: Colors.red
                ),),
                icon: const Icon(Icons.delete, color: Colors.red,),
              )
            ],
          )
        ],
      ),
    );
  }
}