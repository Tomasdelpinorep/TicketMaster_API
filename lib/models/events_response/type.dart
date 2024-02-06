class Type {
	String? id;
	String? name;

	Type({this.id, this.name});

	factory Type.fromJson(Map<String, dynamic> json) => Type(
				id: json['id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
