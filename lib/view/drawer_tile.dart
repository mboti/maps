import 'package:flutter/material.dart';
import 'package:maps/model/map_type.dart';
import 'package:maps/model/map_type_handler.dart';

class DrawerTile extends StatelessWidget{

  final MapType mapType;
  final Function(MapType) onTap;

  const DrawerTile({Key? key, required this.mapType, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(MapTypeHandler().titleForType(mapType)),
      leading: Icon(MapTypeHandler().iconForType(mapType)),
      onTap: (() => onTap(mapType)),
    );
  }
}