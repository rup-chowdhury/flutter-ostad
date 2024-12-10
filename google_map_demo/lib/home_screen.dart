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
        // onTap: (LatLng latLng){
        //   print(latLng);
        // },
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
            ),
            infoWindow: InfoWindow(
              title: 'My Office'
            )
          ),
          Marker(
              markerId: const MarkerId('my-present-home'),
              position: const LatLng(
                23.730949422298362,
                90.42521660684274,
              ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(
              title: 'My Home now',
              onTap: (){
                print('Tapped on Home');
              },
            ),
            draggable: true,
            onDragStart: (LatLng dragStartLatLng){
                print('Start LatLng: $dragStartLatLng');
            },
            onDragEnd: (LatLng dragEndLatLng){
              print('End LatLng: $dragEndLatLng');
            },
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('accidents-in-agargaon'),
            fillColor: Colors.red.withOpacity(0.5),
            center: LatLng(23.776925942436396, 90.38014548482569,),
            radius: 50,
            strokeColor: Colors.red,
            strokeWidth: 5
          ),
          Circle(
            circleId: CircleId('extensive-injury-accidents-in-mirpur12-mor'),
            fillColor: Colors.orange.withOpacity(0.5),
            center: LatLng(23.827890458890693, 90.36406172529641,),
            radius: 7,
            strokeColor: Colors.orange,
            strokeWidth: 0
          ),
          Circle(
              circleId: CircleId('minor-injury-accidents-in-mirpur12-mor'),
              fillColor: Colors.green.withOpacity(0.5),
              center: LatLng(23.82792480908795, 90.36390615718047,),
              radius: 7,
              strokeColor: Colors.green,
              strokeWidth: 0
          ),
          Circle(
              circleId: CircleId('vehicle-collision-accidents-in-mirpur12-mor'),
              fillColor: Colors.yellow.withOpacity(0.5),
              center: LatLng(23.827910087575948, 90.36395443694059,),
              radius: 7,
              strokeColor: Colors.yellow,
              strokeWidth: 0,
              onTap: (){
                print('High possibility of vehicle collision, drive slowly and maintain the rules.');
              }
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId('Path to Heaven'),
            color: Colors.amber,
            width: 4,
            // patterns: List.empty(),
            // jointType: JointType.round,
            points: <LatLng>[
              LatLng(23.825783016281083, 90.36416110811554),
              LatLng(23.727964456798325, 90.41928761126101),
            ]
          )
        },
      ),
    );
  }
}
