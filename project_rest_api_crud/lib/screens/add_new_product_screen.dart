import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _productImageTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  void _onTapAddProductButton(){
    if (_formKey.currentState!.validate()){
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/CreateProduct");
    Map<String, dynamic> requestBody = {
      "Img":"Random 21",
      "ProductCode":"hhh",
      "ProductName":"Now then and later",
      "Qty":"23",
      "TotalPrice":"3456",
      "UnitPrice":"53"
    };
    Response response = await post(uri,
        headers:{
      "Content-Type": "application/json"
    },
      body: jsonEncode(requestBody));

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){

    }
    _inProgress = false;
    setState(() {});
  }

  Widget _buildNewProductForm() {
    return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameTEController,
                decoration: InputDecoration(
                    hintText: "Name", labelText: "Product Name"),
              ),
              TextFormField(
                controller: _unitPriceTEController,
                decoration:
                    InputDecoration(hintText: "Price", labelText: "Unit Price"),
              ),
              TextFormField(
                controller: _quantityTEController,
                decoration: InputDecoration(
                    hintText: "Quantity", labelText: "Quantity"),
              ),
              TextFormField(
                controller: _totalPriceTEController,
                decoration: InputDecoration(
                    hintText: "Total Price", labelText: "Total Price"),
              ),
              TextFormField(
                controller: _productImageTEController,
                decoration: InputDecoration(
                    hintText: "Image", labelText: "Product Image"),
              ),
              TextFormField(
                controller: _productCodeTEController,
                decoration: InputDecoration(
                    hintText: "Code", labelText: "Product Code"),
              ),
              SizedBox(
                height: 48,
              ),
              CupertinoButton(child: Text("Add Product"), onPressed: (){
                _onTapAddProductButton();
              },
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 140),)
            ],
          ),
        );
  }
  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _productImageTEController.dispose();
    _productCodeTEController.dispose();
    super.dispose();
  }
}
