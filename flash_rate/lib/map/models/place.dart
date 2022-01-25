import 'package:flash_rate/map/models/geometry.dart';

class Place {
  final String? name;
  final String? rating;
  final String? userRatinCount;
  final String? vicinity;
  Geometry? geometry;

  Place({this.name, this.rating, this.userRatinCount, this.vicinity});
  Place.fromJson(Map<dynamic, dynamic> parsedJson)
      : name = parsedJson['name'],
        rating = (parsedJson['rating'] != null)
            ? parsedJson['rating'].toDouble()
            : null,
        userRatinCount = (parsedJson['user_ratings_total'] != null)
            ? parsedJson['user_ratings_total']
            : null,
        vicinity = parsedJson['vicinity'],
        geometry = Geometry.fromJson(parsedJson['geometry']);
}
