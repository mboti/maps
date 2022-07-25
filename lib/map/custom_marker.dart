import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMarker extends Marker{
  String savedString;

  CustomMarker({required this.savedString}):super(
      point: LatLng(
          double.parse(savedString.split("&")[0]),
          double.parse(savedString.split("&")[1])
      ),
      builder: (context){
        return const Icon(
          Icons.location_city,
          color: Colors.teal,
          size: 18,
        );
      }
  );
}