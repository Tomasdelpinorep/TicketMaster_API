class SubGenre {
	String? id;
	String? name;

	SubGenre({this.id, this.name});

	factory SubGenre.fromJson(Map<String, dynamic> json) => SubGenre(
				id: json['id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
