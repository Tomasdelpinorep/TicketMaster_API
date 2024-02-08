class Address {
	String? line1;

	Address({this.line1});

	factory Address.fromJson(Map<String, dynamic> json) => Address(
				line1: json['line1'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'line1': line1,
			};
}
