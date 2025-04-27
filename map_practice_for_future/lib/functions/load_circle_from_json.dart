
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_practice_for_future/models/circle_info.dart';

Future <Set<Circle>> loadCirclesFromJson() async {
  final String data = await rootBundle.loadString('assets/circles.json');
  final List<dynamic> jsonResult = json.decode(data);

  Set<Circle> circles = {};

  for(var item in jsonResult) {
    final circleInfo = CircleInfo.fromJson(item);

    circles.add(
      Circle(
          circleId: CircleId(circleInfo.id),
          center: LatLng(circleInfo.centerLat, circleInfo.centerLng),
          radius: circleInfo.radius,
          // fillColor: _color
      ),
    );
  }

  return circles;
}
