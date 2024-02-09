import 'dart:convert';

class Image {
	String? ratio;
	String? url;
	int? width;
	int? height;
	bool? fallback;

	Image({this.ratio, this.url, this.width, this.height, this.fallback});

	factory Image.fromVenueResponse(Map<String, dynamic> data) => Image(
				ratio: data['ratio'] as String?,
				url: data['url'] as String?,
				width: data['width'] as int?,
				height: data['height'] as int?,
				fallback: data['fallback'] as bool?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'ratio': ratio,
				'url': url,
				'width': width,
				'height': height,
				'fallback': fallback,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
	factory Image.fromJson(String data) {
		return Image.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
