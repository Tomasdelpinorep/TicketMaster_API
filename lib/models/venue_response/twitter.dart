import 'dart:convert';

class Twitter {
	String? handle;

	Twitter({this.handle});

	factory Twitter.fromVenueResponse(Map<String, dynamic> data) => Twitter(
				handle: data['handle'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'handle': handle,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Twitter].
	factory Twitter.fromJson(String data) {
		return Twitter.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Twitter] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
