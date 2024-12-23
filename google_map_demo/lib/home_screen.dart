import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_demo/widgets/draw_route_source_to_destination.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GoogleMapController googleMapController;
  Position? position;
  
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};

  final LatLng _startLocation = const LatLng(23.83780971039949, 90.35662645816825); // Example start point

  final LatLng _endLocation = const LatLng(23.826057822068247, 90.36421475229346); // Example end point

  List<LatLng> _polylineCoordinates = []; // To store route points


  @override
  void initState() {
    super.initState();
    listenCurrentLocation();
  }

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
          markers: markers,
          polylines: polyLines,
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

          // markers: <Marker>{
          //   const Marker(
          //     markerId: MarkerId('initial-position'),
          //     position: LatLng(
          //       23.83762441058588,   //LongLat of MIST Tower 3
          //       90.35722629592206,
          //     ),
          //     infoWindow: InfoWindow(
          //       title: 'My Office'
          //     )
          //   ),
          //   Marker(
          //       markerId: const MarkerId('my-present-home'),
          //       position: const LatLng(
          //         23.730949422298362,
          //         90.42521660684274,
          //       ),
          //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          //     infoWindow: InfoWindow(
          //       title: 'My Home now',
          //       onTap: (){
          //         print('Tapped on Home');
          //       },
          //     ),
          //     draggable: true,
          //     onDragStart: (LatLng dragStartLatLng){
          //         print('Start LatLng: $dragStartLatLng');
          //     },
          //     onDragEnd: (LatLng dragEndLatLng){
          //       print('End LatLng: $dragEndLatLng');
          //     },
          //   ),
          // },
          circles: <Circle>{
            Circle(
              circleId: const CircleId('accidents-in-agargaon'),
              fillColor: Colors.red.withOpacity(0.5),
              center: const LatLng(23.776925942436396, 90.38014548482569,),
              radius: 50,
              strokeColor: Colors.red,
              strokeWidth: 5
            ),
            Circle(
              circleId: const CircleId('extensive-injury-accidents-in-mirpur12-mor'),
              fillColor: Colors.orange.withOpacity(0.5),
              center: const LatLng(23.827890458890693, 90.36406172529641,),
              radius: 7,
              strokeColor: Colors.orange,
              strokeWidth: 0
            ),
            Circle(
                circleId: const CircleId('minor-injury-accidents-in-mirpur12-mor'),
                fillColor: Colors.green.withOpacity(0.5),
                center: const LatLng(23.82792480908795, 90.36390615718047,),
                radius: 7,
                strokeColor: Colors.green,
                strokeWidth: 0
            ),
            Circle(
                circleId: const CircleId('vehicle-collision-accidents-in-mirpur12-mor'),
                fillColor: Colors.yellow.withOpacity(0.5),
                center: const LatLng(23.827910087575948, 90.36395443694059,),
                radius: 7,
                strokeColor: Colors.yellow,
                strokeWidth: 0,
                onTap: (){
                  print('High possibility of vehicle collision, drive slowly and maintain the rules.');
                }
            ),
          },
          // polylines: <Polyline>{
          //   const Polyline(
          //     polylineId: PolylineId('Path to Heaven'),
          //     color: Colors.amber,
          //     width: 4,
          //     // patterns: List.empty(),
          //     // jointType: JointType.round,
          //     points: <LatLng>[
          //       LatLng(23.825783016281083, 90.36416110811554),
          //       LatLng(23.727964456798325, 90.41928761126101),
          //     ]
          //   )
          // },
          polygons: <Polygon>{
            Polygon(
              polygonId: const PolygonId('Cantonment-area'),
              points: <LatLng>[
                const LatLng(23.828077194899823, 90.36381539669782),
                const LatLng(23.82843051027161, 90.35553273562799),
                const LatLng(23.828862338863736, 90.35480317480837),
                const LatLng(23.82956896436851, 90.35497483617769),
                const LatLng(23.83004004590001, 90.35392341029058),
                const LatLng(23.830511125720804, 90.35396632563291),
                const LatLng(23.83162993343889, 90.35531815891633),
                const LatLng(23.834163120594944, 90.35531223806039),
                const LatLng(23.835598031602274, 90.35559745612099),
                const LatLng(23.845805008697706, 90.35320875490486),
                const LatLng(23.84741913752646, 90.36386877991916),
                const LatLng(23.84373698500129, 90.36426538910318),
                const LatLng(23.83671058321892, 90.36503786553409),
                const LatLng(23.833138355947984, 90.36538118827275),
                const LatLng(23.831018526217225, 90.36520952690343),
                const LatLng(23.82917346103148, 90.364694542795460),
              ],
              fillColor: Colors.blue.withOpacity(0.3),
              strokeColor: Colors.blue,
              strokeWidth: 2,
            ),
          },
        ),
      floatingActionButton:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                const CameraPosition(
                  zoom: 16,
                    target: LatLng(
                        23.730949422298362,
                        90.42521660684274),
                ),
              )
            );
            },
          child: const Icon(Icons.home),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: (){
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    zoom: 17,
                      target: LatLng(
                          23.83762441058588,   //LongLat of MIST Tower 3
                          90.35722629592206
                      ),
                  ),
                ),
              );
            },
            child: const Icon(Icons.work),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton.extended(onPressed: () async {
            Position position = await _determinePosition();

            _addRoute(_startLocation, _endLocation);

            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


            markers.clear();

            markers.add(Marker(markerId: MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

            polyLines.add(Polyline(polylineId: PolylineId('path-to-something'), points: <LatLng>[
              LatLng(position.latitude, position.longitude),
              LatLng(position.latitude + 0.004, position.longitude + 0.0007),
              LatLng(position.latitude + 0.004, position.longitude + 0.005),
              LatLng(position.latitude - 0.009, position.longitude + 0.0007),
              const LatLng(37.41526285159456, -122.09481652826072),
              const LatLng(37.42143688980525, -122.09361489862204)
            ]));
            setState(() {});
          },
            label: const Text('Current Location'),
            icon: const Icon(Icons.location_on),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Future<void> listenCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if (isGranted) {
      final isServiceEnabled = await checkGPSServiceEnabled();
      if(isServiceEnabled) {
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            timeLimit: Duration(seconds: 3),
            // distanceFilter: 1,
            accuracy: LocationAccuracy.best
          )
        ).listen((pos) {
          print(pos);
        });
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      final result = await requestLocationPermission();
      if(result){
        getCurrentLocation();
      } else {
        Geolocator.openAppSettings();
      }
    }
  }

  Future<bool> isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkGPSServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> getCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if (isGranted) {
      final isServiceEnabled = await checkGPSServiceEnabled();
      if(isServiceEnabled) {
        Position p = await Geolocator.getCurrentPosition();
        position = p;
        print(position);
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      final result = await requestLocationPermission();
      if(result){
        getCurrentLocation();
      } else {
        Geolocator.openAppSettings();
      }
    }
  }


  //Trial

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position posma = await Geolocator.getCurrentPosition();

    return posma;
  }



  // Example: Add a route between two points
  void _addRoute(LatLng start, LatLng end) async {
    // **Important:** Replace with your Google Maps API key
    const apiKey = 'AIzaSyA3KP1kyVmShHUoei0xZhy0J6RNUiHiEBg';

    // Construct the Google Maps Directions API URL
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?'
        'origin=${start.latitude},${start.longitude}&'
        'destination=${end.latitude},${end.longitude}&'
        'key=$apiKey&'
        'mode=walking'; // Adjust mode as needed (driving, walking, etc.)

    // Fetch the route data from the API
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (data['routes'].isNotEmpty) {
      final route = data['routes'][0]['overview_polyline']['points'];
      final decodedPoints = DrawRouteSourceToDestination().decodePolyline(route);

      final polyline = Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue.shade50,
        width: 7,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: decodedPoints,
          patterns: [PatternItem.dash(10), PatternItem.gap(7)],
      );

      setState(() {
        polyLines.add(polyline);
      });
    } else {
      print('No routes found.');
    }
  }

}
