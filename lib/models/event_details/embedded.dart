import 'attraction.dart';
import 'venue.dart';

class Embedded {
	List<Venue>? venues;
	List<Attraction>? attractions;

	Embedded({this.venues, this.attractions});

	factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
				venues: (json['venues'] as List<dynamic>?)
						?.map((e) => Venue.fromJson(e as Map<String, dynamic>))
						.toList(),
				attractions: (json['attractions'] as List<dynamic>?)
						?.map((e) => Attraction.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'venues': venues?.map((e) => e.toJson()).toList(),
				'attractions': attractions?.map((e) => e.toJson()).toList(),
			};
}
