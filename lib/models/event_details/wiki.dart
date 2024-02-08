class Wiki {
	String? url;

	Wiki({this.url});

	factory Wiki.fromJson(Map<String, dynamic> json) => Wiki(
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
			};
}
