import 'classification.dart';

class Product {
	String? name;
	String? id;
	String? url;
	String? type;
	List<Classification>? classifications;

	Product({this.name, this.id, this.url, this.type, this.classifications});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
				name: json['name'] as String?,
				id: json['id'] as String?,
				url: json['url'] as String?,
				type: json['type'] as String?,
				classifications: (json['classifications'] as List<dynamic>?)
						?.map((e) => Classification.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'id': id,
				'url': url,
				'type': type,
				'classifications': classifications?.map((e) => e.toJson()).toList(),
			};
}
