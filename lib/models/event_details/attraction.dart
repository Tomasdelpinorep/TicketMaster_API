class Attraction {
	String? href;

	Attraction({this.href});

	factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
				href: json['href'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'href': href,
			};
}
