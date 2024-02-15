import 'dart:convert';

import 'embedded.dart';
import 'links.dart';
import 'page.dart';

class VenueResponse {
	Embedded? embedded;
	Links? links;
	Page? page;

	VenueResponse({this.embedded, this.links, this.page});

	factory VenueResponse.fromVenueResponse(Map<String, dynamic> data) {
		return VenueResponse(
			embedded: data['_embedded'] == null
						? null
						: Embedded.fromVenueResponse(data['_embedded'] as Map<String, dynamic>),
			links: data['_links'] == null
						? null
						: Links.fromVenueResponse(data['_links'] as Map<String, dynamic>),
			page: data['page'] == null
						? null
						: Page.fromVenueResponse(data['page'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toVenueResponse() => {
				'_embedded': embedded?.toVenueResponse(),
				'_links': links?.toVenueResponse(),
				'page': page?.toVenueResponse(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VenueResponse].
	factory VenueResponse.fromJson(String data) {
		return VenueResponse.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [VenueResponse] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
