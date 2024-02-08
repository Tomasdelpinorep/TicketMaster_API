class Genre {
	String? id;
	String? name;

	Genre({this.id, this.name});

	factory Genre.fromJson(Map<String, dynamic> json) => Genre(
				id: json['id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
