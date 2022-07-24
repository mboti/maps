import 'package:flutter_map/plugin_api.dart';
import 'package:maps/map/options/tile_layer_o.dart';

class TileLayerW extends TileLayerWidget{

  final TileLayerO tileOptions;

  TileLayerW({required this.tileOptions}): super(options: tileOptions);
}