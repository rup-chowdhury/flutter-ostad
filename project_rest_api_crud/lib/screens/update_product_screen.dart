import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:project_rest_api_crud/models/product.dart';
import 'package:project_rest_api_crud/screens/product_list_screen.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.name, required this.code, required this.price, required this.quantity, required this.img, required this.totalPrice, required this.id});

  final String id;
  final String name;
  final String code;
  final String price;
  final String quantity;
  final String img;
  final String totalPrice;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {

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
  void initState() {
    // TODO: implement initState
    _productNameTEController.text = widget.name;
    _productCodeTEController.text = widget.code;
    _productImageTEController.text = widget.img;
    _unitPriceTEController.text = widget.price;
    _quantityTEController.text = widget.quantity;
    _totalPriceTEController.text = widget.totalPrice;
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  void _onTapUpdateProductButton(){
    if (_formKey.currentState!.validate()) {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.id}");
    Map<String, dynamic> requestBody = {
      "Img": _productImageTEController.text,
      "ProductCode": _productCodeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text
    };
    Response response = await post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product Updated Successfully !")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return ProductListScreen();
      }));
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid value";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _unitPriceTEController,
                decoration:
                    InputDecoration(hintText: "Price", labelText: "Unit Price"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid value";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityTEController,
                decoration: InputDecoration(
                    hintText: "Quantity", labelText: "Quantity"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid value";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _totalPriceTEController,
                decoration: InputDecoration(
                    hintText: "Total Price", labelText: "Total Price"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid value";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productImageTEController,
                decoration: InputDecoration(
                    hintText: "Image", labelText: "Product Image"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid value";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productCodeTEController,
                decoration: InputDecoration(
                    hintText: "Code", labelText: "Product Code"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid value";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48,
              ),
              _inProgress
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : CupertinoButton(child: Text("Update"), onPressed: (){
                _onTapUpdateProductButton();
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
