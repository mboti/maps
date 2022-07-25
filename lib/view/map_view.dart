import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/map/options/map_o.dart';
import 'package:maps/map/options/tile_layer_o.dart';
import 'package:maps/map/widgets/tile_layer_w.dart';
import 'package:maps/model/map_type.dart';
import 'package:maps/model/map_type_handler.dart';


class MapView extends StatelessWidget{

  /// latlong2: ^0.8.1 me permet de récuperer les "LatLng"
  final LatLng center;
  final MapController mapController;
  final double zoom;
  final List<MapPlugin> plugins;
  final MapType mapType;
  final List<Marker> markers;

  const MapView({
    Key? key,
    required this.mapController,
    required this.center,
    required this.zoom,
    required this.plugins,
    required this.mapType,
    required this.markers
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      //key: ValueKey(MediaQuery.of(context).orientation),
      mapController: mapController,
      options: MapO(center: center, zoom: zoom, plugins: plugins),
      children: [
        TileLayerW( tileOptions: TileLayerO()),
        // Ajoute une marque nous indiquer notre position
        LocationMarkerLayerWidget(),
        //ajout des calques sur ma view en fonction du Drawer
        MapTypeHandler().layerForType(mapType, markers),
      ],
    );
  }
}