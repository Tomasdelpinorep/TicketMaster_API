class Twitter {
	String? url;

	Twitter({this.url});

	factory Twitter.fromJson(Map<String, dynamic> json) => Twitter(
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
			};
}
