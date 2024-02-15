class GeneralInfo {
	String? generalRule;
	String? childRule;

	GeneralInfo({this.generalRule, this.childRule});

	factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
				generalRule: json['generalRule'] as String?,
				childRule: json['childRule'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'generalRule': generalRule,
				'childRule': childRule,
			};
}
