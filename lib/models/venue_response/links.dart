import 'dart:convert';

import 'self.dart';

class Links {
	Self? self;

	Links({this.self});

	factory Links.fromVenueResponse(Map<String, dynamic> data) => Links(
				self: data['self'] == null
						? null
						: Self.fromVenueResponse(data['self'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toVenueResponse() => {
				'self': self?.toVenueResponse(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Links].
	factory Links.fromJson(String data) {
		return Links.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Links] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
