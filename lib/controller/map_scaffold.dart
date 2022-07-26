
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/map/custom_marker.dart';
import 'package:maps/model/map_type.dart';
import 'package:maps/model/remarkable_place.dart';
import 'package:maps/services/datas_manager.dart';
import 'package:maps/services/location_manager.dart';
import 'package:maps/view/app_bar_view.dart';
import 'package:maps/view/drawer_view.dart';
import 'package:maps/view/map_view.dart';


class MapScaffold extends StatefulWidget{
  final Position startPosition;

  const MapScaffold({Key? key, required this.startPosition}): super(key: key);

  @override
  MapScaffoldState createState() => MapScaffoldState();
}



class MapScaffoldState extends State<MapScaffold>{

  // Attributs
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MapType mapType = MapType.simple;

  MapController mapController = MapController();
  double zoom = 12;
  LatLng center = LatLng(0, 0);

  Stream<Position> listener = LocationManager().positionListener();
  late StreamSubscription<Position> subscription;

  bool shouldFollow = true;
  Icon get followIcon => Icon((shouldFollow) ? Icons.location_on : Icons.location_off, color: Colors.white,);

  List<Marker> markers = [];



  @override
  void initState() {
    super.initState();
    center = LatLng(widget.startPosition.latitude, widget.startPosition.longitude);
    observePositionChanges(); //Observons le changement de position
    getMarkers();
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
      key: scaffoldKey,
      appBar: AppBarView(
        context: context,
        menuPressed: menuPressed,
        followPosition: locationTaped,
        zoomIn: zoomIn,
        zoomOut: zoomOut,
        followIcon: followIcon,
      ),

      drawer: DrawerView(
        onDrawerTap: onDrawerTap,
      ),

      body: MapView(
          mapController: mapController,
          center: center,
          zoom: zoom,
          plugins: [],
          mapType: mapType,
          markers: markers
      ),

    );
  }

  observePositionChanges(){
    subscription = listener.listen((newPosition) {
      updatePosition(newPosition);
    });
    mapController.mapEventStream.listen((event) {
      // si je fais un lonPress
      if(event is MapEventLongPress){
        final LatLng tap = event.tapPosition;
        final lat = tap.latitude;
        final lon = tap.longitude;
        RemarkablePlace newPlace = RemarkablePlace(lat: lat, lon: lon);
        final String toBeSave = newPlace.toBeSavedString;

        // Ajouter au Shared preference
        DatasManager().saveDatas(toBeSave).then((success) => getMarkers());
      }
      //zoom = event.zoom; //remplacer par mapController pour corriger un bug sous iOS
      zoom = mapController.zoom; //Garder en mémoire le zoom
    });
  }

  getMarkers() async {
    final newMarkers = await DatasManager().getDatas();
    final list = newMarkers.map((e) => CustomMarker(savedString: e)).toList();
    setState(() => markers = list);
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
    scaffoldKey.currentState?.openDrawer();
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

  onDrawerTap(MapType mapType){
    setState(() {
      this.mapType = mapType;
      Navigator.of(context).pop();
    });
  }
}