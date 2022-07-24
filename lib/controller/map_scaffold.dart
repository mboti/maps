
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/services/location_manager.dart';
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

  Stream<Position> listener = LocationManager().positionListener();
  late StreamSubscription<Position> subscription;

  bool shouldFollow = true;
  Icon get followIcon => Icon((shouldFollow) ? Icons.location_on : Icons.location_off, color: Colors.white,);

  @override
  void initState() {
    super.initState();
    center = LatLng(widget.startPosition.latitude, widget.startPosition.longitude);
    observePositionChanges(); //Observons le changement de position
  }

  @override
  void dispose() {
    //mapController.dispose();
    stopObserving();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        context: context,
        menuPressed: menuPressed,
        followPosition: locationTaped,
        zoomIn: zoomIn,
        zoomOut: zoomOut,
        followIcon: followIcon,
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
    subscription = listener.listen((newPosition) {
      updatePosition(newPosition);
    });
    mapController.mapEventStream.listen((event) {
      //zoom = event.zoom; //remplacer par mapController pour corriger un bug sous iOS
      zoom = mapController.zoom; //Garder en mémoire le zoom
    });
  }

  updatePosition(Position position){
    center = LatLng(position.latitude, position.longitude);
    mapController.move(center, zoom);
  }

  stopObserving(){
    subscription.cancel();
  }

  //Actions relatives aux controles
  menuPressed(){

  }

  // Cette méthode va nous permettre d'avoir comme référentiel soit une personne soit la carte
  locationTaped(){
    setState(() {
      shouldFollow = !shouldFollow;
      shouldFollow ? observePositionChanges() : stopObserving();
    });
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