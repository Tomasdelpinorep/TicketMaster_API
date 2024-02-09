import 'dart:convert';

class Next {
	String? href;

	Next({this.href});

	factory Next.fromVenueResponse(Map<String, dynamic> data) => Next(
				href: data['href'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'href': href,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Next].
	factory Next.fromJson(String data) {
		return Next.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Next] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
