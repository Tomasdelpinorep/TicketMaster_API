class Accessibility {
	int? ticketLimit;

	Accessibility({this.ticketLimit});

	factory Accessibility.fromJson(Map<String, dynamic> json) => Accessibility(
				ticketLimit: json['ticketLimit'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'ticketLimit': ticketLimit,
			};
}
