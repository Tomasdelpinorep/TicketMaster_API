class Venue {
	String? href;

	Venue({this.href});

	factory Venue.fromJson(Map<String, dynamic> json) => Venue(
				href: json['href'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'href': href,
			};
}
