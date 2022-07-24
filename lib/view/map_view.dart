import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapView extends StatelessWidget{

  /// latlong2: ^0.8.1 me permet de récuperer les "LatLng"
  final LatLng center;
  final double zoom;

  MapView({
    Key? key,
    required this.center,
    required this.zoom
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: center,
        zoom: zoom,
        maxZoom: 16,
        plugins: [],
      ),
      children: [
        TileLayerWidget(
         options: TileLayerOptions(
           urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
           subdomains: ['a', 'b', 'c'],
           // attributionBuilder: (_) {  // Cet attribut n'existe plus
           //   return Text("© OpenStreetMap contributors");
           // },
         ),
        )
      ],
    );
  }
}