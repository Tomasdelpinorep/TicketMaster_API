import 'dart:convert';

class Page {
	int? size;
	int? totalElements;
	int? totalPages;
	int? number;

	Page({this.size, this.totalElements, this.totalPages, this.number});

	factory Page.fromVenueResponse(Map<String, dynamic> data) => Page(
				size: data['size'] as int?,
				totalElements: data['totalElements'] as int?,
				totalPages: data['totalPages'] as int?,
				number: data['number'] as int?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'size': size,
				'totalElements': totalElements,
				'totalPages': totalPages,
				'number': number,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Page].
	factory Page.fromJson(String data) {
		return Page.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Page] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
