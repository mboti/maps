
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/view/app_bar_view.dart';
import 'package:maps/view/map_view.dart';


class MapScaffold extends StatefulWidget{
  final Position startPosition;

  const MapScaffold({Key? key, required this.startPosition}): super(key: key);

  @override
  MapScaffoldState createState() => MapScaffoldState();
}



class MapScaffoldState extends State<MapScaffold>{

  MapController mapController = MapController();
  double zoom = 12;
  LatLng center = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    center = LatLng(widget.startPosition.latitude, widget.startPosition.longitude);
  }

  // @override
  // void dispose() {
  //   mapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        context: context,
        menuPressed: menuPressed,
        followPosition: locationTaped,
        zoomIn: zoomIn,
        zoomOut: zoomOut,
      ),
      body: MapView(
        mapController: mapController,
        center: center,
        zoom: zoom,
        plugins: [],
      ),

    );
  }

  observePositionChanges(){

  }

  stopObserving(){

  }

  //Actions relatives aux controles
  menuPressed(){

  }

  locationTaped(){

  }

  zoomIn(){
    setState(() {
      zoom = mapController.zoom + 0.5;
      mapController.move(center, zoom);
    });
  }

  zoomOut(){
    setState(() {
      zoom = mapController.zoom - 0.5;
      mapController.move(center, zoom);
    });
  }
}