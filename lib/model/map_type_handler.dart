import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:maps/map/widgets/marker_layer_w.dart';
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

  Widget layerForType(MapType mapType, List<Marker> markers){
    switch(mapType){
      case MapType.simple: return Container();
      // case MapType.annotations: return MarkerLayerWidget(
      //   options: MarkerLayerOptions(
      //     markers: markers,
      //   ),
      // );
      case MapType.annotations: return MarkerLayerW(markers: markers);
      case MapType.cluster: return Container();
      case MapType.popup: return Container();
      case MapType.clusterAndPop: return Container();
    }
  }
}