class State {
	String? name;
	String? stateCode;

	State({this.name, this.stateCode});

	factory State.fromJson(Map<String, dynamic> json) => State(
				name: json['name'] as String?,
				stateCode: json['stateCode'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'stateCode': stateCode,
			};
}
