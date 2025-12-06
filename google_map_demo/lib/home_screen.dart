import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng? _initialPosition;

  @override
  void initState() {
    super.initState();
    _setInitialLocation();
  }

  Set<Marker> markers = {};
  Timer? _timer;
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Screen'),
      ),
      body: _initialPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              markers: markers,
              polylines: polylines,
              mapType: MapType.satellite,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
              trafficEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _initialPosition!,
                zoom: 16,
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _initialPosition == null
            ? null
            : () async {
                final hasPermission = await requestLocationPermission();
                if (hasPermission) {
                  _updatePosition();

                  _timer?.cancel();
                  _timer = Timer.periodic(const Duration(seconds: 10), (_) {
                    _updatePosition();
                  });
                }
              },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Future<void> _setInitialLocation() async {
    try {
      final position = await _determinePosition();
      if (mounted) {
        setState(() {
          _initialPosition = LatLng(position.latitude, position.longitude);
        });
      }
    } catch (e) {
      print("Error getting initial location: $e");
      if (mounted) {
        setState(() {
          _initialPosition = const LatLng(
              23.83762441058588, 90.35722629592206); // Default location
        });
      }
    }
  }

  Future<void> _updatePosition() async {
    try {
      final Position position = await _determinePosition();
      final latLng = LatLng(position.latitude, position.longitude);
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 16,
          ),
        ),
      );

      if (mounted) {
        markers.removeWhere(
            (marker) => marker.markerId.value == 'currentLocation');
        markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: latLng,
            infoWindow: InfoWindow(
              title: 'My Current Location',
              snippet: '${position.latitude}, ${position.longitude}',
            ),
          ),
        );
        polylineCoordinates.add(latLng);
        polylines.clear();
        polylines.add(
          Polyline(
            polylineId: const PolylineId('route'),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 5,
          ),
        );
        setState(() {});
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

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

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
