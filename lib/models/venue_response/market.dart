import 'dart:convert';

class Market {
	String? name;
	String? id;

	Market({this.name, this.id});

	factory Market.fromVenueResponse(Map<String, dynamic> data) => Market(
				name: data['name'] as String?,
				id: data['id'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'name': name,
				'id': id,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Market].
	factory Market.fromJson(String data) {
		return Market.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Market] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
