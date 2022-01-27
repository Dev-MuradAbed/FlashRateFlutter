import 'package:flash_rate/map/services/places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../models/place.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final placesProvider =
        Provider.of<Future<List<Place>>>(context);

    return FutureProvider(
        create: (_) => placesProvider,
        initialData: [],
        child: Scaffold(
          body: (currentPosition != null)
              ? FutureBuilder<List<Place>>(
                  future: PlacesService().getPlaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(currentPosition.latitude,
                                      currentPosition.longitude),
                                  zoom: 16.0),
                              zoomGesturesEnabled: true,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                // itemCount: PlacesService().getPlaces().,
                                itemBuilder: (_, index) {
                                  return Card(
                                    child: ListTile(
                                      title: Text('${snapshot.data![index].name}'),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    } else {
                      
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
