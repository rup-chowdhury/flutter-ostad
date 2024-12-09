import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GoogleMapController googleMapController;

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
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },
        trafficEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
            23.83762441058588,   //LongLat of MIST Tower 3
            90.35722629592206,
          ),
          zoom: 32,
        ),
        markers: <Marker>{
          const Marker(
            markerId: MarkerId('initial-position'),
            position: LatLng(
              23.83762441058588,   //LongLat of MIST Tower 3
              90.35722629592206,
            )
          ),
          const Marker(
              markerId: MarkerId('pollobi-metro'),
              position: LatLng(
                23.82610317065891,
                90.36407638895095,
              )
          ),
        },
      ),
    );
  }
}
