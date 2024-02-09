import 'dart:convert';

class UpcomingEvents {
	int? tmr;
	int? ticketmaster;
	int? total;
	int? filtered;

	UpcomingEvents({this.tmr, this.ticketmaster, this.total, this.filtered});

	factory UpcomingEvents.fromVenueResponse(Map<String, dynamic> data) {
		return UpcomingEvents(
			tmr: data['tmr'] as int?,
			ticketmaster: data['ticketmaster'] as int?,
			total: data['_total'] as int?,
			filtered: data['_filtered'] as int?,
		);
	}



	Map<String, dynamic> toVenueResponse() => {
				'tmr': tmr,
				'ticketmaster': ticketmaster,
				'_total': total,
				'_filtered': filtered,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UpcomingEvents].
	factory UpcomingEvents.fromJson(String data) {
		return UpcomingEvents.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [UpcomingEvents] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
