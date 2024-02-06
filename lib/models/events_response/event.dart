import 'classification.dart';
import 'dates.dart';
import 'embedded.dart';
import 'image.dart';
import 'links.dart';
import 'price_range.dart';
import 'promoter.dart';
import 'sales.dart';

class Event {
	String? name;
	String? type;
	String? id;
	bool? test;
	String? url;
	String? locale;
	List<Image>? images;
	Sales? sales;
	Dates? dates;
	List<Classification>? classifications;
	Promoter? promoter;
	List<Promoter>? promoters;
	List<PriceRange>? priceRanges;
	Links? links;
	Embedded? embedded;

	Event({
		this.name, 
		this.type, 
		this.id, 
		this.test, 
		this.url, 
		this.locale, 
		this.images, 
		this.sales, 
		this.dates, 
		this.classifications, 
		this.promoter, 
		this.promoters, 
		this.priceRanges, 
		this.links, 
		this.embedded, 
	});

	factory Event.fromJson(Map<String, dynamic> json) => Event(
				name: json['name'] as String?,
				type: json['type'] as String?,
				id: json['id'] as String?,
				test: json['test'] as bool?,
				url: json['url'] as String?,
				locale: json['locale'] as String?,
				images: (json['images'] as List<dynamic>?)
						?.map((e) => Image.fromJson(e as Map<String, dynamic>))
						.toList(),
				sales: json['sales'] == null
						? null
						: Sales.fromJson(json['sales'] as Map<String, dynamic>),
				dates: json['dates'] == null
						? null
						: Dates.fromJson(json['dates'] as Map<String, dynamic>),
				classifications: (json['classifications'] as List<dynamic>?)
						?.map((e) => Classification.fromJson(e as Map<String, dynamic>))
						.toList(),
				promoter: json['promoter'] == null
						? null
						: Promoter.fromJson(json['promoter'] as Map<String, dynamic>),
				promoters: (json['promoters'] as List<dynamic>?)
						?.map((e) => Promoter.fromJson(e as Map<String, dynamic>))
						.toList(),
				priceRanges: (json['priceRanges'] as List<dynamic>?)
						?.map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
						.toList(),
				links: json['_links'] == null
						? null
						: Links.fromJson(json['_links'] as Map<String, dynamic>),
				embedded: json['_embedded'] == null
						? null
						: Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'type': type,
				'id': id,
				'test': test,
				'url': url,
				'locale': locale,
				'images': images?.map((e) => e.toJson()).toList(),
				'sales': sales?.toJson(),
				'dates': dates?.toJson(),
				'classifications': classifications?.map((e) => e.toJson()).toList(),
				'promoter': promoter?.toJson(),
				'promoters': promoters?.map((e) => e.toJson()).toList(),
				'priceRanges': priceRanges?.map((e) => e.toJson()).toList(),
				'_links': links?.toJson(),
				'_embedded': embedded?.toJson(),
			};
}
