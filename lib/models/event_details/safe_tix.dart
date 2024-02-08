class SafeTix {
	bool? enabled;

	SafeTix({this.enabled});

	factory SafeTix.fromJson(Map<String, dynamic> json) => SafeTix(
				enabled: json['enabled'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'enabled': enabled,
			};
}
