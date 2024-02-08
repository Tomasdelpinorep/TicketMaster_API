import 'dart:convert';

class Last {
	String? href;

	Last({this.href});

	factory Last.fromVenueResponse(Map<String, dynamic> data) => Last(
				href: data['href'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'href': href,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Last].
	factory Last.fromJson(String data) {
		return Last.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Last] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
