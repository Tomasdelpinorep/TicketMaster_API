class Market {
	String? name;
	String? id;

	Market({this.name, this.id});

	factory Market.fromJson(Map<String, dynamic> json) => Market(
				name: json['name'] as String?,
				id: json['id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'id': id,
			};
}
