

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const GOOGLE_MAPS_API_KEY = "AIzaSyA3KP1kyVmShHUoei0xZhy0J6RNUiHiEBg";
const COUNTRY = "country";
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging fcm = FirebaseMessaging.instance;
GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: GOOGLE_MAPS_API_KEY);