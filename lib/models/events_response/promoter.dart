class Promoter {
	String? id;
	String? name;

	Promoter({this.id, this.name});

	factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
				id: json['id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
