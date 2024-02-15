class Page {
	int? size;
	int? totalElements;
	int? totalPages;
	int? number;

	Page({this.size, this.totalElements, this.totalPages, this.number});

	factory Page.fromJson(Map<String, dynamic> json) => Page(
				size: json['size'] as int?,
				totalElements: json['totalElements'] as int?,
				totalPages: json['totalPages'] as int?,
				number: json['number'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'size': size,
				'totalElements': totalElements,
				'totalPages': totalPages,
				'number': number,
			};
}
