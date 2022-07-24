import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps/controller/map_scaffold.dart';
import 'package:maps/controller/no_data_controller.dart';
import 'package:maps/services/location_manager.dart';

class HomeController extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <Position>(
      future: LocationManager().start(),
      builder: ((context, position) => (position.hasData) ? MapScaffold(startPosition: position.data!,): const NoDataController())
    );
  }

}