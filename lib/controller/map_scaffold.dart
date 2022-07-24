
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/view/map_view.dart';


class MapScaffold extends StatefulWidget{
  final Position startPosition;

  const MapScaffold({Key? key, required this.startPosition}): super(key: key);

  @override
  MapScaffoldState createState() => MapScaffoldState();
}



class MapScaffoldState extends State<MapScaffold>{



  @override
  Widget build(BuildContext context) {
    double latitude = widget.startPosition.latitude;
    double longitude = widget.startPosition.longitude;
    return Scaffold(
      body:
      // Center(
      //     child: Text("On a des datas $latitude & $longitude")
      // ),
      MapView(
        center: LatLng(latitude, longitude),
        zoom: 12,
      ),

    );
  }


}