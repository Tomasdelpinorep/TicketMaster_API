import 'dart:convert';

class First {
	String? href;

	First({this.href});

	factory First.fromVenueResponse(Map<String, dynamic> data) => First(
				href: data['href'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'href': href,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [First].
	factory First.fromJson(String data) {
		return First.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [First] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
