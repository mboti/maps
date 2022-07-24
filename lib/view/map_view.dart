import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/map/options/map_o.dart';
import 'package:maps/map/options/tile_layer_o.dart';
import 'package:maps/map/widgets/tile_layer_w.dart';


class MapView extends StatelessWidget{

  /// latlong2: ^0.8.1 me permet de récuperer les "LatLng"
  final LatLng center;
  final double zoom;
  final List<MapPlugin> plugins;

  MapView({
    Key? key,
    required this.center,
    required this.zoom,
    required this.plugins
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapO(center: center, zoom: zoom, plugins: plugins),
      children: [ TileLayerW( tileOptions: TileLayerO()),],
    );
  }
}