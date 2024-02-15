class Facebook {
	String? url;

	Facebook({this.url});

	factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
			};
}
