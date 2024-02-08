class Presale {
	String? startDateTime;
	String? endDateTime;
	String? name;

	Presale({this.startDateTime, this.endDateTime, this.name});

	factory Presale.fromJson(Map<String, dynamic> json) => Presale(
				startDateTime: json['startDateTime'] as String?,
				endDateTime: json['endDateTime'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'startDateTime': startDateTime,
				'endDateTime': endDateTime,
				'name': name,
			};
}
