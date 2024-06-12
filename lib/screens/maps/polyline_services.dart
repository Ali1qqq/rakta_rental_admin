import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'location_model.dart';

class PolylineService {
  Future<Polyline> getdrawPolyline(List<LatLng> polylineCoordinate,Color color) async {
    try {
      List<LatLng> polylineCoordinates = polylineCoordinate;

      return Polyline(
          polylineId: PolylineId("polyline_id ${polylineCoordinates.length}"),
          color: color,
          width: 5,
          points: polylineCoordinates,
          consumeTapEvents: true,
          onTap: () {

          });
    } on Exception catch (e) {
      Get.snackbar("Error with path", e.toString());
      throw Exception();
    }
  }


}
