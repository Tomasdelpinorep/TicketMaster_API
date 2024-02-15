class AgeRestrictions {
	bool? legalAgeEnforced;

	AgeRestrictions({this.legalAgeEnforced});

	factory AgeRestrictions.fromJson(Map<String, dynamic> json) {
		return AgeRestrictions(
			legalAgeEnforced: json['legalAgeEnforced'] as bool?,
		);
	}



	Map<String, dynamic> toJson() => {
				'legalAgeEnforced': legalAgeEnforced,
			};
}
