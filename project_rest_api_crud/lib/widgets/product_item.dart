import 'package:flutter/material.dart';
import 'package:project_rest_api_crud/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: const Text("Product Name"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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