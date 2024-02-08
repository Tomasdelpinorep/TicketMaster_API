import 'dart:convert';

class Country {
	String? name;
	String? countryCode;

	Country({this.name, this.countryCode});

	factory Country.fromVenueResponse(Map<String, dynamic> data) => Country(
				name: data['name'] as String?,
				countryCode: data['countryCode'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'name': name,
				'countryCode': countryCode,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Country].
	factory Country.fromJson(String data) {
		return Country.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
