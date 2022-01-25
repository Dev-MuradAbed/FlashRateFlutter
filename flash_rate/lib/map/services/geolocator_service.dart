import 'package:flash_rate/map/Screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocatorServise extends ChangeNotifier  {
  late double lat;
  late double lng;

void  getLocation() async {
    Position position;
    Position currentPosition;
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    // latLng = LatLng(position.latitude, position.longitude);
    lat = position.latitude;
    lng = position.longitude;
    // CameraPosition(target: latLng, zoom: 16.0);

    notifyListeners();
  }
}
