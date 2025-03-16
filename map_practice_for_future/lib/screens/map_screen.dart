import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:map_practice_for_future/screens/search_places_screen.dart';
import 'package:map_practice_for_future/values.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location _locationController = new Location();

  static const LatLng _initialPosition =
      LatLng(23.838405415619437, 90.3595992615412);
  LatLng _dhakaAirportPosition = LatLng(23.851995216355434, 90.40838517263411);

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  LatLng? _currentPosition = null;

  late TextEditingController destinationTextEditingController =
      TextEditingController();

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdate().then((_) => {
          getPolylinePoints().then(
            (coordinates) => {
              generatePolylineFromPoints(coordinates),
            },
          ),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _currentPosition == null
            ? const Center(
                child: Text(
                  'Loading.....',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )
            : buildGoogleMap(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: destinationTextEditingController,
                  onTap: () {
                    // _addRoute(_startLocation, _endLocation);
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    focusColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        )),
                    border: OutlineInputBorder(),
                    hintText: 'Destination',
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // DestinationSelectionWidget();
        },
        child: const Icon(Icons.home),
      ),
    );
  }

  GoogleMap buildGoogleMap() {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      trafficEnabled: true,
      mapType: MapType.hybrid,
      buildingsEnabled: false,
      compassEnabled: true,
      mapToolbarEnabled: true,
      onLongPress: (LatLng destiny) {
        setDestination(destiny);
      },
      onTap: (argument) => drawPolyline(),
      onMapCreated: ((GoogleMapController controller) =>
          _mapController.complete(controller)),
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 13,
      ),
      markers: {
        Marker(
          markerId: MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarkerWithHue(184),
          position: _currentPosition!,
        ),
        // Marker(
        //   markerId: MarkerId("_sourceLocation"),
        //   icon: BitmapDescriptor.defaultMarker,
        //   position: _initialPosition,
        //   draggable: true
        // ),
        Marker(
          markerId: MarkerId("_destinationLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _dhakaAirportPosition,
          draggable: true,
          onDragEnd: setDestination,
        ),
      },
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  Future<void> _cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition =
        CameraPosition(target: position, zoom: 13);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
    // setState(() {
    // generatePolylineFromPoints(getPolylinePoints() as List<LatLng>);
    // });
  }

  Future<void> getLocationUpdate() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(_currentPosition);
          _cameraToPosition(_currentPosition!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polyLineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    // googleApiKey: GOOGLE_MAPS_API_KEY,
    // request: PolylineRequest(
    //     origin: PointLatLng(
    //         _currentPosition!.latitude, _currentPosition!.longitude),
    //     destination: PointLatLng(_dhakaAirportPosition.latitude,
    //         _dhakaAirportPosition.longitude),
    //     mode: TravelMode.driving)
    //    );
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        PointLatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        PointLatLng(
            _dhakaAirportPosition.latitude, _dhakaAirportPosition.longitude));
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polyLineCoordinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly1");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }

  void drawPolyline() {
    setState(() {
      getLocationUpdate().then((_) => {
            getPolylinePoints().then(
              (coordinates) => {
                generatePolylineFromPoints(coordinates),
              },
            ),
          });
    });
  }

  void setDestination(LatLng destination) {
    _dhakaAirportPosition = destination;
    getPolylinePoints();
  }
}
