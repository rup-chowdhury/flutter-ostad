import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:map_practice_for_future/values.dart';
import 'package:google_maps_webservice/places.dart' as pl;
import 'package:google_api_headers/google_api_headers.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

  const kGoogleApiKey = 'AIzaSyA3KP1kyVmShHUoei0xZhy0J6RNUiHiEBg';
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _MapScreenState extends State<MapScreen> {
  final Location _locationController = Location();

  static const LatLng _initialPosition =
      LatLng(23.838405415619437, 90.3595992615412);
  LatLng _dhakaAirportPosition = LatLng(23.851995216355434, 90.40838517263411);

  Set<Marker> markersList = {};


  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  late GoogleMapController googleMapController;

  LatLng? _currentPosition;

  late TextEditingController destinationTextEditingController =
      TextEditingController();

  Map<PolylineId, Polyline> polylines = {};

  final Mode _mode = Mode.overlay;

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
                    _handlePressButton();
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
    );
  }

  Future<void> _handlePressButton() async {
    pl.Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white))),
        components: [pl.Component(pl.Component.country,"bd"),pl.Component(pl.Component.country,"bd")]);


    displayPrediction(p!,homeScaffoldKey.currentState);
  }

  void onError(pl.PlacesAutocompleteResponse response){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: response.errorMessage!,
        contentType: ContentType.failure,
      ),
    ));

    // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(pl.Prediction p, ScaffoldState? currentState) async {

    pl.GoogleMapsPlaces places = pl.GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders()
    );

    pl.PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markersList.clear();
    markersList.add(Marker(markerId: const MarkerId("0"),position: LatLng(lat, lng),infoWindow: InfoWindow(title: detail.result.name)));

    destinationTextEditingController.text = detail.result.name;
    setState(() {});

    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));

    print('Checking..............');
    print(detail);
    print(detail.result);
    print(detail.result.geometry);
    print(detail.result.geometry!.location);
    LatLng locToLatLng = LatLng(detail.result.geometry!.location.lat, detail.result.geometry!.location.lng);
    setDestination(locToLatLng);
    drawPolyline();

  }


  GoogleMap buildGoogleMap() {
    return GoogleMap(

      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 13,
      ),
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
      onMapCreated: (GoogleMapController controller){
          _mapController.complete(controller);
          googleMapController = controller;
      },
      markers:
      {
      ...markersList,
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
    CameraPosition newCameraPosition =
        CameraPosition(target: position, zoom: 13);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
    // setState(() {
    // generatePolylineFromPoints(getPolylinePoints() as List<LatLng>);
    // });
  }

  Future<void> getLocationUpdate() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
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
          // _cameraToPosition(_currentPosition!);
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
      for (var point in result.points) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
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

  @override
  void dispose() {
    _mapController;
    destinationTextEditingController;
    googleMapController;
    _locationController;
    // TODO: implement dispose
    super.dispose();
  }
}

