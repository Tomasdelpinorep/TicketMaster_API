class SubType {
	String? id;
	String? name;

	SubType({this.id, this.name});

	factory SubType.fromJson(Map<String, dynamic> json) => SubType(
				id: json['id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
