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
  runApp(MyApp());
}

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
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return placesService.getPlaces(lat: position.altitude, lng:position.longitude);
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
