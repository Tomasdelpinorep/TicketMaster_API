class Homepage {
	String? url;

	Homepage({this.url});

	factory Homepage.fromJson(Map<String, dynamic> json) => Homepage(
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
			};
}
