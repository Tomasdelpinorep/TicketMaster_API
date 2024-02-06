class State {
	String? name;

	State({this.name});

	factory State.fromJson(Map<String, dynamic> json) => State(
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
			};
}
