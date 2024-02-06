class Segment {
	String? id;
	String? name;

	Segment({this.id, this.name});

	factory Segment.fromJson(Map<String, dynamic> json) => Segment(
				id: json['id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
