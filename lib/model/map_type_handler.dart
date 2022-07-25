import 'package:flutter/material.dart';
import 'package:maps/model/map_type.dart';

class MapTypeHandler{

  String titleForType(MapType mapType){

    switch(mapType){
      case MapType.simple: return "Simple";
      case MapType.annotations: return "Markers";
      case MapType.cluster: return "Pop-up";
      case MapType.popup: return "Cluster";
      case MapType.clusterAndPop: return "Cluster & Pop-up";
    }
  }


  IconData iconForType(MapType mapType){
    switch(mapType){
      case MapType.simple: return Icons.map;
      case MapType.annotations: return Icons.location_on;
      case MapType.cluster: return Icons.message;
      case MapType.popup: return Icons.add_circle_sharp;
      case MapType.clusterAndPop: return Icons.supervised_user_circle_sharp;
    }
  }


}