class UpcomingEvents {
	int? ticketmaster;
	int? total;
	int? filtered;

	UpcomingEvents({this.ticketmaster, this.total, this.filtered});

	factory UpcomingEvents.fromJson(Map<String, dynamic> json) {
		return UpcomingEvents(
			ticketmaster: json['ticketmaster'] as int?,
			total: json['_total'] as int?,
			filtered: json['_filtered'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'ticketmaster': ticketmaster,
				'_total': total,
				'_filtered': filtered,
			};
}
