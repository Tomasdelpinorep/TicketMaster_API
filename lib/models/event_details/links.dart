import 'attraction.dart';
import 'self.dart';
import 'venue.dart';

class Links {
	Self? self;
	List<Attraction>? attractions;
	List<Venue>? venues;

	Links({this.self, this.attractions, this.venues});

	factory Links.fromJson(Map<String, dynamic> json) => Links(
				self: json['self'] == null
						? null
						: Self.fromJson(json['self'] as Map<String, dynamic>),
				attractions: (json['attractions'] as List<dynamic>?)
						?.map((e) => Attraction.fromJson(e as Map<String, dynamic>))
						.toList(),
				venues: (json['venues'] as List<dynamic>?)
						?.map((e) => Venue.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'self': self?.toJson(),
				'attractions': attractions?.map((e) => e.toJson()).toList(),
				'venues': venues?.map((e) => e.toJson()).toList(),
			};
}
