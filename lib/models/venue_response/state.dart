import 'dart:convert';

class State {
	String? name;
	String? stateCode;

	State({this.name, this.stateCode});

	factory State.fromVenueResponse(Map<String, dynamic> data) => State(
				name: data['name'] as String?,
				stateCode: data['stateCode'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'name': name,
				'stateCode': stateCode,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [State].
	factory State.fromJson(String data) {
		return State.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [State] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
