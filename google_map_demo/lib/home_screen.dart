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
        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId('Cantonment-area'),
            points: <LatLng>[
              LatLng(23.828077194899823, 90.36381539669782),
              LatLng(23.82843051027161, 90.35553273562799),
              LatLng(23.828862338863736, 90.35480317480837),
              LatLng(23.82956896436851, 90.35497483617769),
              LatLng(23.83004004590001, 90.35392341029058),
              LatLng(23.830511125720804, 90.35396632563291),
              LatLng(23.83162993343889, 90.35531815891633),
              LatLng(23.834163120594944, 90.35531223806039),
              LatLng(23.835598031602274, 90.35559745612099),
              LatLng(23.845805008697706, 90.35320875490486),
              LatLng(23.84741913752646, 90.36386877991916),
              LatLng(23.84373698500129, 90.36426538910318),
              LatLng(23.83671058321892, 90.36503786553409),
              LatLng(23.833138355947984, 90.36538118827275),
              LatLng(23.831018526217225, 90.36520952690343),
              LatLng(23.82917346103148, 90.364694542795460),
            ],
            fillColor: Colors.blue.withOpacity(0.3),
            strokeColor: Colors.blue,
            strokeWidth: 2,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 16,
                target: LatLng(
                    23.730949422298362,
                    90.42521660684274))
          )
        );
        },
      child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
