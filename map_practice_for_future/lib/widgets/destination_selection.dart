import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_google_places_hoc081098/src/places_autocomplete_field.dart';
import 'package:flutter_google_places_hoc081098/src/flutter_google_places.dart';
import 'package:flutter_google_places_hoc081098/src/places_autocomplete_form_field.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_maps_webservices/places.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

import 'package:map_practice_for_future/helpers/constants.dart';
import 'package:map_practice_for_future/providers/app_state.dart';


class DestinationSelectionWidget extends StatelessWidget {
  const DestinationSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.28,
      minChildSize: 0.28,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.8),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: ListView(
            controller: myscrollController,
            children: [
              Icon(
                Icons.remove,
                size: 40,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  color: Colors.grey.withOpacity(.3),
                  child: TextField(
                    onTap: () async {
                      SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                      Prediction pol;
                      pol = (await PlacesAutocomplete.show(
                          context: context,
                          apiKey: "AIzaSyA3KP1kyVmShHUoei0xZhy0J6RNUiHiEBg",
                          language: "en", // Mode.fullscreen
                          // language: "pt",
                          components: [
                            Component(Component.country, "bd"),
                          ]
                      )
                      )!;

                      PlacesDetailsResponse detail =
                      await places.getDetailsByPlaceId(pol.placeId);
                      double lat = detail.result.geometry!.location.lat;
                      double lng = detail.result.geometry!.location.lng;
                      appState.changeRequestedDestination(
                          reqDestination: pol.description!, lat: lat, lng: lng);
                      appState.updateDestination(destination: pol.description!);
                      LatLng coordinates = LatLng(lat, lng);
                      appState.setDestination(coordinates: coordinates);
                      appState.addPickupMarker(appState.center);
                      appState.changeWidgetShowed(
                          showWidget: Show.PICKUP_SELECTION);
                      // appState.sendRequest(coordinates: coordinates);
                    },
                    textInputAction: TextInputAction.go,
                    controller: appState.destinationController,
                    cursorColor: Colors.blue.shade900,
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 15),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.teal,
                        ),
                      ),
                      hintText: "Where to go?",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[300],
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                title: Text("Home"),
                subtitle: Text("25th avenue, 23 street"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[300],
                  child: Icon(
                    Icons.work,
                    color: Colors.white,
                  ),
                ),
                title: Text("Work"),
                subtitle: Text("25th avenue, 23 street"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.18),
                  child: Icon(
                    Icons.history,
                    color: Colors.teal,
                  ),
                ),
                title: Text("Recent location"),
                subtitle: Text("25th avenue, 23 street"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.18),
                  child: Icon(
                    Icons.history,
                    color: Colors.teal,
                  ),
                ),
                title: Text("Recent location"),
                subtitle: Text("25th avenue, 23 street"),
              ),
            ],
          ),
        );
      },
    );
  }
}
