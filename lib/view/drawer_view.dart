import 'package:flutter/material.dart';
import 'package:maps/model/map_type.dart';
import 'package:maps/view/drawer_header.dart';
import 'package:maps/view/drawer_tile.dart';

class DrawerView extends StatelessWidget{

  final Function(MapType) onDrawerTap;


  const DrawerView({Key? key, required this.onDrawerTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: drawerList(),
      ),
    );
  }

  List<Widget> drawerList(){
    List<Widget> list = [const CustomDrawerHeader()];
    list.addAll(MapType.values.map((mapType) => DrawerTile(mapType: mapType, onTap: onDrawerTap)).toList());
    return list;
  }
}