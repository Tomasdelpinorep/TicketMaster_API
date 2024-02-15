import 'embedded.dart';
import 'links.dart';
import 'page.dart';

class EventsResponse {
	Embedded? embedded;
	Links? links;
	Page? page;

	EventsResponse({this.embedded, this.links, this.page});

	factory EventsResponse.fromJson(Map<String, dynamic> json) {
		return EventsResponse(
			embedded: json['_embedded'] == null
						? null
						: Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
			links: json['_links'] == null
						? null
						: Links.fromJson(json['_links'] as Map<String, dynamic>),
			page: json['page'] == null
						? null
						: Page.fromJson(json['page'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'_embedded': embedded?.toJson(),
				'_links': links?.toJson(),
				'page': page?.toJson(),
			};
}
