import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_rest_api_crud/models/product.dart';
import 'package:project_rest_api_crud/screens/update_product_screen.dart';
import 'package:project_rest_api_crud/screens/add_new_product_screen.dart';
import 'package:project_rest_api_crud/screens/product_list_screen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(widget.product.productName),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: ${widget.product.productCode}"),
          Text("Price: ${widget.product.unitPrice}"),
          Text("Quantity: ${widget.product.quantity}"),
          Text("Total Price: ${widget.product.totalPrice}"),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return UpdateProductScreen();
                  }),
                  );
                },
                label: const Text("Edit", style: TextStyle(
                    color: Colors.blue
                ),),
                icon: const Icon(Icons.edit, color: Colors.blue,),
              ),
              _isDeleted
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : TextButton.icon(
                onPressed: () {
                  deleteData(widget.product.id);
                  setState(() {});
                },
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
  Future<void> deleteData(String id) async{
    _isDeleted = true;
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/DeleteProduct/${id}");
    Response response = await get(uri);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product has been Deleted !")));
      setState(() {
      ProductListScreen();

      });
    }

    _isDeleted = false;

  }
}

