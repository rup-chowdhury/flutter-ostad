import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_rest_api_crud/screens/add_new_product_screen.dart';
import 'package:project_rest_api_crud/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }

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
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const AddNewProductScreen();
        },
        ),
        );
      },
        backgroundColor: Colors.blueGrey[200],
      child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {

    //API calling part

    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/ReadProduct");
    Response response = await get(uri);                          // receiving the response from the API


    print(response);
    print(response.statusCode);
    print(response.body);
  }
}


