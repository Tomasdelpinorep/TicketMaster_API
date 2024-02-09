import 'dart:convert';

import 'twitter.dart';

class Social {
	Twitter? twitter;

	Social({this.twitter});

	factory Social.fromVenueResponse(Map<String, dynamic> data) => Social(
				twitter: data['twitter'] == null
						? null
						: Twitter.fromVenueResponse(data['twitter'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toVenueResponse() => {
				'twitter': twitter?.toVenueResponse(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Social].
	factory Social.fromJson(String data) {
		return Social.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Social] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
