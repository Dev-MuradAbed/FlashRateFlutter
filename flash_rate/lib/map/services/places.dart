import 'package:flash_rate/map/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
 static final key = 'AIzaSyCpbK_5pts7uhrQJLxpu7N3-LzePoDOMqg';
  Future<List<Place>> getplaces(double lat, double lng) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&hospital&rankby=distance&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['results'] as List;
   return jsonResult.map((place) => Place.fromJson(place)).toList();
  }
}
