import 'package:flutter/material.dart';

class TransformLatLng extends StatefulWidget {

  @override
  State<TransformLatLng> createState() => _State();
}

class _State extends State<TransformLatLng> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.teal
            ])
      ),
    );
  }
}
