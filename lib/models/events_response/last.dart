class Last {
	String? href;

	Last({this.href});

	factory Last.fromJson(Map<String, dynamic> json) => Last(
				href: json['href'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'href': href,
			};
}
