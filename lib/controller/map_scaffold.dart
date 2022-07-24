import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class MapScaffold extends StatefulWidget{
  final Position startPosition;

  const MapScaffold({Key? key, required this.startPosition}): super(key: key);

  @override
  MapScaffoldState createState() => MapScaffoldState();
}



class MapScaffoldState extends State<MapScaffold>{



  @override
  Widget build(BuildContext context) {
    String latitude = widget.startPosition.latitude.toString();
    String longitude = widget.startPosition.longitude.toString();
    return Scaffold(
      body: Center(

          child: Text("On a des datas $latitude & $longitude")
      ),
    );
  }


}