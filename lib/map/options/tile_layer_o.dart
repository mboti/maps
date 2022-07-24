import 'package:flutter_map/flutter_map.dart';

class TileLayerO extends TileLayerOptions{

  TileLayerO():super(
    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    subdomains: ['a', 'b', 'c'],
    // attributionBuilder: (_) {  // Cet attribut n'existe plus
    //   return Text("© OpenStreetMap contributors");
    // },
  );
}