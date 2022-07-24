import 'package:geolocator/geolocator.dart';

class LocationManager{

  Future<Position> start() async{
    final bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    return (locationEnabled) ? await handlePermission() : await errorString("Location désactivée");
  }

  Future<Position> handlePermission() async{
    final LocationPermission locationPermission = await Geolocator.checkPermission();
    return await resultPermission(locationPermission);
  }

  Future<Position> resultPermission(LocationPermission locationPermission) async{
    switch (locationPermission){
      case LocationPermission.deniedForever:
        return errorString("Permission refusée");
      case LocationPermission.denied:
        return request().then((newPermission) => resultPermission(newPermission));
      case LocationPermission.unableToDetermine:
        return request().then((newPermission) => resultPermission(newPermission));
      case LocationPermission.whileInUse:
        return await getPosition();
      case LocationPermission.always:
        return await getPosition();
    }
  }

  Future<Position> getPosition() async => await Geolocator.getCurrentPosition();

  Future<LocationPermission> request() async => await Geolocator.requestPermission();

  Future<Position> errorString(String err) async => await Future.error(err);

  Stream<Position> positionListener(){
    const accuracy = LocationAccuracy.high;
    const distance = 10; //MAJ de la position tous les 10m par exemple
    const LocationSettings locationSettings = LocationSettings(accuracy: accuracy, distanceFilter: distance);
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

}