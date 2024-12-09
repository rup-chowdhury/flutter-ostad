import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Screen'),
      ),
      body: GoogleMap(
        onTap: (LatLng latLng){
          print(latLng);
        },
        mapType: MapType.satellite,
        zoomControlsEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
            23.83762441058588,   //LongLat of MIST Tower 3
            90.35722629592206,
          ),
          zoom: 32,
        ),
      ),
    );
  }
}
