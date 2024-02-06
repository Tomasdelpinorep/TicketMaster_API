import 'event.dart';

class Embedded {
	List<Event>? events;

	Embedded({this.events});

	factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
				events: (json['events'] as List<dynamic>?)
						?.map((e) => Event.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'events': events?.map((e) => e.toJson()).toList(),
			};
}
