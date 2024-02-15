class Seatmap {
	String? staticUrl;

	Seatmap({this.staticUrl});

	factory Seatmap.fromJson(Map<String, dynamic> json) => Seatmap(
				staticUrl: json['staticUrl'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'staticUrl': staticUrl,
			};
}
