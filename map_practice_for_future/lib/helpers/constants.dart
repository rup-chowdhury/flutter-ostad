

const GOOGLE_MAPS_API_KEY = "AIzaSyC_MPgcB-GAIUYap_caF_lQdB1UqFIEhMg";
const COUNTRY = "country";
Firestore firebaseFiretore = Firestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging fcm = FirebaseMessaging();
GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: GOOGLE_MAPS_API_KEY);