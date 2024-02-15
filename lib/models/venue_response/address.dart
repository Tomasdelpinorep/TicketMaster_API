import 'dart:convert';

class Address {
	String? line1;

	Address({this.line1});

	factory Address.fromVenueResponse(Map<String, dynamic> data) => Address(
				line1: data['line1'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'line1': line1,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
	factory Address.fromJson(String data) {
		return Address.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
