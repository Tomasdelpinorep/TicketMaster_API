class Next {
	String? href;

	Next({this.href});

	factory Next.fromJson(Map<String, dynamic> json) => Next(
				href: json['href'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'href': href,
			};
}
