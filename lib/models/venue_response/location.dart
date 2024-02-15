import 'dart:convert';
import 'dart:ffi';

class Location {
  String? longitude;
  String? latitude;

  Location({this.longitude, this.latitude});

  factory Location.fromVenueResponse(Map<String, dynamic> data) => Location(
        longitude: data['longitude'] as String?,
        latitude: data['latitude'] as String?,
      );

  Map<String, dynamic> toVenueResponse() => {
        'longitude': longitude,
        'latitude': latitude,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Location].
  factory Location.fromJson(String data) {
    return Location.fromVenueResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Location] to a JSON string.
  String toJson() => json.encode(toVenueResponse());
}
