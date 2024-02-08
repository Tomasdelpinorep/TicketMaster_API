import 'dart:convert';

import 'venue.dart';

class Embedded {
	List<Venue>? venues;

	Embedded({this.venues});

	factory Embedded.fromVenueResponse(Map<String, dynamic> data) => Embedded(
				venues: (data['venues'] as List<dynamic>?)
						?.map((e) => Venue.fromVenueResponse(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toVenueResponse() => {
				'venues': venues?.map((e) => e.toVenueResponse()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Embedded].
	factory Embedded.fromJson(String data) {
		return Embedded.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Embedded] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
