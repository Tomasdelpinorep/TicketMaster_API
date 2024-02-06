class First {
	String? href;

	First({this.href});

	factory First.fromJson(Map<String, dynamic> json) => First(
				href: json['href'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'href': href,
			};
}
