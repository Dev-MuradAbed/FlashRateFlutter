import 'package:flash_rate/map/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyCpbK_5pts7uhrQJLxpu7N3-LzePoDOMqg';

  Future<List<Place>> getPlaces({lat, lng}) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=health&rankby=distance&key=$key'));
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      var jsonResults = json['results'] as List;
      return jsonResults.map((e) => Place.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Place');
    }
    // var json = convert.jsonDecode(response.body);
    // var jsonResults = json['results'] as List;

    // var list = jsonResults.map((place) => Place.fromJson(place)).toList();
    // print('${list[1].name}');

    // return list;
  }
}
