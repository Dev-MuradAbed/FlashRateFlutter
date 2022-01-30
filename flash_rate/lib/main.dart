import 'dart:math';

import 'package:flash_rate/map/Screens/search.dart';
import 'package:flash_rate/map/models/place.dart';
import 'package:flash_rate/map/services/geolocator_service.dart';
import 'package:flash_rate/theme.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'map/services/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// _bpm 317.7423339732551
//  this_bpm 184

//  _bpm 117.62042103121564
//  this_bpm 164

int? firstRun;
// void main() async {
//   // SharedPreferences prefs = await SharedPreferences.getInstance();
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (_) => GeoLocatorServise(),
//       )
//     ],
//     child: MyApp(),
//   ));
// }
void main() {
  // List<LatLng> polylineCoordinates = [
  //   LatLng(31.425116, 34.38021),
  //   LatLng(31.420637, 34.359642),
  //   LatLng(31.444065, 34.386180),
  //   LatLng(31.449542, 34.390493),
  //   LatLng(31.478006, 34.415810),
  //   // LatLng(31.428048, 34.341332),
  //   // LatLng(31.347937, 34.293189),
  // ];
  //(lat2-lat1)+(lon2-lon1)

  // var dist = sqrt(pow(2, (31.444014 - 31.425116)) + pow(2,34.386141 - 34.38021));
  // testkm km = testkm();
  // var KM =
  //     km.getDistanceFromLatLonInKm(31.425116, 34.38021, 31.444014, 34.386141);
  // print(KM);
  // double d = 1.5567899;
  // String fixed1 = d.toStringAsFixed(1); // 1.6
  // print(fixed1);
  runApp(MyApp());
  // test t = test();
  // t._calcDistance(polylineCoordinates);
}

class testkm {
  getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
    return d.toStringAsFixed(1);
  }

  deg2rad(deg) {
    return deg * (pi / 180);
  }

  alongTrackDistanceTo(pathStart, pathEnd, {radius = 6371e3}) {}
}

class test {
  void _calcDistance(List<LatLng> polylineCoordinates) {
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      double totalDistance = 0.0;

      totalDistance = _coordineCoordinates(
        polylineCoordinates[0].latitude,
        polylineCoordinates[0].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
      print('${polylineCoordinates[0].latitude}');
      print('${polylineCoordinates[0].longitude}');
      print('${polylineCoordinates[i + 1].latitude}');
      print('${polylineCoordinates[i + 1].longitude}');
      print(
          "distance = =============================================${totalDistance.toStringAsFixed(2)} km");
      print('55555555555555555');
    }
    // print(
    // "distance = =============================================${totalDistance.toStringAsFixed(2)} km");
  }

  double _coordineCoordinates(lat1, lng1, lat2, lng2) {
    var p = 0.0174532925119943295;
    var c = cos;
    var a = 0.5;
    c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
//0.9999999999999002880028484711573+

// int Beats = 117.62042103121564.toInt();
// int Hei = 185;
// int Wei = 185;
// int Agg = 22;
// double Q = 4.5;
// double ROB = 18.5;
// double ET = (364.5 - 1.23 * Beats);
// double BSA = 0.007184 * (math.pow(Wei, 0.425)) * (math.pow(Hei, 0.725));
// double SV = (-6.6 +
//     (0.25 * (ET - 35)) -
//     (0.62 * Beats) +
//     (40.4 * BSA) -
//     (0.51 * Agg));
// double PP = SV / ((0.013 * Wei - 0.007 * Agg - 0.004 * Beats) + 1.307);
// double MPP = Q * ROB;
// int SP = (MPP + 3 / 2 * PP).toInt();
// int DP = (MPP - PP / 3).toInt();
// print('$SP/$DP');

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorServise();
  final placesService = PlacesService();
  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled = false;

    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => locatorService.getLocation(),
          initialData: null,
        ),
        FutureProvider(
          create: (context) {
            ImageConfiguration configuration =
                createLocalImageConfiguration(context);
            return BitmapDescriptor.fromAssetImage(
                configuration, 'assets/hospital.png');
          },
          initialData: null,
        ),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            print('main result ${position.latitude},${position.longitude}');
            return placesService.getPlaces(
              latt: position.latitude,
              lngt: position.longitude,
            );
          },
        )
      ],
      child: MaterialApp(
        themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        theme: MyThemes.lightTheme(context),
        darkTheme: MyThemes.darkTheme(context),
        debugShowCheckedModeBanner: false,
        home: const bottomNavigationBar(),
        // home: Search(),
        // ),
        //  ),
      ),
    );
  }
}
