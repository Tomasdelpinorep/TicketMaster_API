import 'dart:convert';

class City {
	String? name;

	City({this.name});

	factory City.fromVenueResponse(Map<String, dynamic> data) => City(
				name: data['name'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'name': name,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [City].
	factory City.fromJson(String data) {
		return City.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [City] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
