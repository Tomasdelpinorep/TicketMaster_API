class City {
	String? name;

	City({this.name});

	factory City.fromJson(Map<String, dynamic> json) => City(
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
			};
}
