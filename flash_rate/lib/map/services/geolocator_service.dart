import 'package:flash_rate/map/Screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocatorServise extends ChangeNotifier  {
Future<Position>  getLocation() async {
  
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
