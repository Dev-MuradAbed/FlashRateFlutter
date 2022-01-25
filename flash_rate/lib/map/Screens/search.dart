import 'dart:async';

import 'package:flash_rate/map/models/place.dart';
import 'package:flash_rate/map/services/geolocator_service.dart';
import 'package:flash_rate/map/services/places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class Search extends StatelessWidget {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newgoogleMapController;
  @override
  // late Position currentPosition;
  // var geoLocator = Geolocator();
  // double bottomPaddingOfMap = 0;
  // static String? address;
  // late LatLng latLatPosition;
  // late LocationPermission permission;
  // late double lattude;
  // late double lngtude;
  // void locatePosition() async {
  //   permission = await Geolocator.requestPermission();
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   currentPosition = position;

  //   latLatPosition = LatLng(position.latitude, position.longitude);

  //   lattude = position.latitude;
  //   print('the lat= $lattude');
  //   lngtude = position.longitude;
  //   print('the lng= $lngtude');

  //   CameraPosition cameraPosition =
  //       CameraPosition(target: latLatPosition, zoom: 15);

  //   newgoogleMapController!
  //       .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

  //   // print("This is your Address :: " + address!);
  // }

  Widget build(BuildContext context) {
    bool currentPositio = true;
    return Scaffold(
      body: (currentPositio != false)
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            3.25, 56.556),
                        zoom: 16.0),
                    zoomControlsEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                   
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
          
                // Expanded(child: ListView.builder(itemBuilder: (context,index){
                //   return Card(
                //     child: ListTile(
                //       // title:,
                //     ),
                //   )
                // },))
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}


