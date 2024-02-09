import 'dart:convert';

class GeneralInfo {
	String? generalRule;
	String? childRule;

	GeneralInfo({this.generalRule, this.childRule});

	factory GeneralInfo.fromVenueResponse(Map<String, dynamic> data) {
		return GeneralInfo(
			generalRule: data['generalRule'] as String?,
			childRule: data['childRule'] as String?,
		);
	}



	Map<String, dynamic> toVenueResponse() => {
				'generalRule': generalRule,
				'childRule': childRule,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeneralInfo].
	factory GeneralInfo.fromJson(String data) {
		return GeneralInfo.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GeneralInfo] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
