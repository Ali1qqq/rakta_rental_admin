import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_View_Model.dart';

class MapsScreen extends StatefulWidget {
  MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  int? markerNow;
  List text = ["Crowd", "Road problem", "car accident", "Closed road","Garage", "Crowd of people",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(builder: (homeViewModel) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: GoogleMap(
                myLocationButtonEnabled: false,
                compassEnabled: true,
                zoomControlsEnabled: false,
                webGestureHandling: homeViewModel.mapEnabled ?WebGestureHandling.auto:WebGestureHandling.none,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(target: LatLng(25.781507, 55.942091), zoom: 15),
                mapType: MapType.normal,
                // polygons: {Polygon(polygonId: PolygonId("1"), points: homeViewModel.ridesPloy, fillColor: Colors.green.withOpacity(0.2), strokeWidth: 2)},
                onMapCreated: (controller) async {
                  String mapStyle = await rootBundle.loadString('assets/map_style.json');
                  // controller.setMapStyle(mapStyle);
                  homeViewModel.controller = Completer();
                  homeViewModel.controller.complete(controller);
                  homeViewModel.setMarker(const LatLng(25.734574568324156, 55.88672951847148), "garage", "bus1", "10", size: 25);
                  homeViewModel.setMarker(const LatLng(25.793155670461086, 55.948370475284605), "garage", "bus2", "10", size: 25);
                },
                onTap: (_) {
                  if (homeViewModel.mapEnabled&&markerNow != null) {
                    homeViewModel.setMapMarker(_, "map${markerNow! + 1}", Random().nextInt(100200).toString(), "0");
                    setState(() {});
                  }
                },
                markers: homeViewModel.markers.values.toSet(),
                polylines: homeViewModel.polyLines,
              ),
            ),
            MouseRegion(
              onEnter: (PointerEnterEvent event) {
                homeViewModel.mapEnabled=false;
                homeViewModel.update();
              },
              onExit: (PointerExitEvent event) {
                homeViewModel.mapEnabled=true;
                homeViewModel.update();
              },
              child:     Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 140,
                      width: 500,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:List.generate(5, (index) => Expanded(
                          child: InkWell(
                            onTap: (){
                              markerNow = index;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(color: markerNow == index ?Colors.blue:Colors.transparent,borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 5,),
                                      Image.asset("assets/map${index+1}.png",width: 60,),
                                      SizedBox(height: 5,),
                                      Expanded(child: Center(child: Text(text[index],style: TextStyle(color: Colors.black),maxLines: null,textAlign: TextAlign.center,)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            markerNow = 4;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(color: markerNow == 5 ?Colors.blue:Colors.transparent,borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Image.asset("assets/map6.png",width: 60,),
                                  SizedBox(height: 5,),
                                  Expanded(child: Center(child: Text(text[5],style: TextStyle(color: Colors.black),maxLines: null,textAlign: TextAlign.center,)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
