class Promoter {
	String? id;
	String? name;
	String? description;

	Promoter({this.id, this.name, this.description});

	factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
				id: json['id'] as String?,
				name: json['name'] as String?,
				description: json['description'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'description': description,
			};
}
