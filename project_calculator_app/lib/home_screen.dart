import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cheap Calculator")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNumTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "First Number",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.transparent.withOpacity(0.7)),
                    labelText: "First Number"),
                validator: (String? value){
                  if(value == null || value.isEmpty ){
                    return "Enter a value";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _secondNumTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Second Number",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.transparent.withOpacity(0.7)),
                    labelText: "Second Number"),
                  validator: (String? value){
                    if(value == null || value.isEmpty ){
                      return "Enter a value";
                    }else{
                      return null;
                    }
                  }
              ),
              const SizedBox(height: 32),
              _buildButtonBar(),
              const SizedBox(
                height: 24,
              ),
              Text(" Result : ${_result.toStringAsFixed(2)}", style: const TextStyle(
                fontSize: 18
              ),)
            ],
          ),
        ),
      ),
    );
  }


  // Method Extraction or Widget Extraction

  Widget _buildButtonBar(){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {
          _onTapAddButton();
        }, icon: const Icon(Icons.add)),
        IconButton(onPressed: () {
          _onTapSubtractButton();
        }, icon: const Icon(Icons.remove)),
        TextButton(
            onPressed: () {
              _onTapMultiplyButton();
            },
            child: Text(
              "x",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 20),
            )),
        TextButton(
          onPressed: () {
            _onTapDivideButton();
          },
          child: Text(
            "/",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.8),
                fontSize: 18),
          ),
        ),
      ],
    );
  }

  void _onTapAddButton(){
    if(_formKey.currentState!.validate()){
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNum + secondNum;
      setState(() {});
    }

  }

  void _onTapSubtractButton(){
    if(_formKey.currentState!.validate()){
    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum - secondNum;
    setState(() {});

    }
  }

  void _onTapMultiplyButton(){
    if(_formKey.currentState!.validate()){
    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum * secondNum;
    setState(() {});
    }
  }

  void _onTapDivideButton(){
    if(_formKey.currentState!.validate()){
    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum / secondNum;
    setState(() {});
    }
  }

}
