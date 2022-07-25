import 'package:latlong2/latlong.dart';

class RemarkablePlace{
  double lat;
  double lon;
  String? _city;
  String? _adress;

  RemarkablePlace({required this.lat, required this.lon});



  // getter & setter
  String get adress => _adress ?? "";

  set adress(String value) {
    _adress = value;
  }

  String get city => _city ?? "";

  set city(String value) {
    _city = value;
  }

  LatLng get center => LatLng(lat, lon);

  String get toBeSavedString => "$lat & $lon";
}