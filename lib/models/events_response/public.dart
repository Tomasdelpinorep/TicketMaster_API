class Public {
	String? startDateTime;
	bool? startTbd;
	bool? startTba;
	String? endDateTime;

	Public({
		this.startDateTime, 
		this.startTbd, 
		this.startTba, 
		this.endDateTime, 
	});

	factory Public.fromJson(Map<String, dynamic> json) => Public(
				startDateTime: json['startDateTime'] as String?,
				startTbd: json['startTBD'] as bool?,
				startTba: json['startTBA'] as bool?,
				endDateTime: json['endDateTime'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'startDateTime': startDateTime,
				'startTBD': startTbd,
				'startTBA': startTba,
				'endDateTime': endDateTime,
			};
}
