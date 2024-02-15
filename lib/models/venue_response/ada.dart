import 'dart:convert';

class Ada {
	String? adaPhones;
	String? adaCustomCopy;
	String? adaHours;

	Ada({this.adaPhones, this.adaCustomCopy, this.adaHours});

	factory Ada.fromVenueResponse(Map<String, dynamic> data) => Ada(
				adaPhones: data['adaPhones'] as String?,
				adaCustomCopy: data['adaCustomCopy'] as String?,
				adaHours: data['adaHours'] as String?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'adaPhones': adaPhones,
				'adaCustomCopy': adaCustomCopy,
				'adaHours': adaHours,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ada].
	factory Ada.fromJson(String data) {
		return Ada.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Ada] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
