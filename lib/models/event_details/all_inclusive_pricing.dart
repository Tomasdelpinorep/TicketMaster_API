class AllInclusivePricing {
	bool? enabled;

	AllInclusivePricing({this.enabled});

	factory AllInclusivePricing.fromJson(Map<String, dynamic> json) {
		return AllInclusivePricing(
			enabled: json['enabled'] as bool?,
		);
	}



	Map<String, dynamic> toJson() => {
				'enabled': enabled,
			};
}
