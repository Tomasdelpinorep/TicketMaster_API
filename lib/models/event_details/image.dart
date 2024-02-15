class Image {
	String? ratio;
	String? url;
	int? width;
	int? height;
	bool? fallback;

	Image({this.ratio, this.url, this.width, this.height, this.fallback});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				ratio: json['ratio'] as String?,
				url: json['url'] as String?,
				width: json['width'] as int?,
				height: json['height'] as int?,
				fallback: json['fallback'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'ratio': ratio,
				'url': url,
				'width': width,
				'height': height,
				'fallback': fallback,
			};
}
