class Instagram {
	String? url;

	Instagram({this.url});

	factory Instagram.fromJson(Map<String, dynamic> json) => Instagram(
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
			};
}
