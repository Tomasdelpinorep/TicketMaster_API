class Country {
	String? name;
	String? countryCode;

	Country({this.name, this.countryCode});

	factory Country.fromJson(Map<String, dynamic> json) => Country(
				name: json['name'] as String?,
				countryCode: json['countryCode'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'countryCode': countryCode,
			};
}
