import 'geometry.dart';

class Place {
  final String name;
   var rating;
   var userRatingCount;
  final String? vicinity;
  final Geometry geometry;

  Place(
      {required this.geometry,
      required this.name,
      required this.rating,
      required this.userRatingCount,
      required this.vicinity});

 factory Place.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Place(
        name: parsedJson['name'],
        geometry: Geometry.fromJson(parsedJson['geometry']),
        rating: parsedJson['rating'],
        vicinity: parsedJson['vicinity'],
        userRatingCount: parsedJson['user_ratings_total']);
  }
}
