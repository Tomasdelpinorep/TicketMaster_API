class UpcomingEvents {
	int? mfxEs;
	int? total;
	int? filtered;

	UpcomingEvents({this.mfxEs, this.total, this.filtered});

	factory UpcomingEvents.fromJson(Map<String, dynamic> json) {
		return UpcomingEvents(
			mfxEs: json['mfx-es'] as int?,
			total: json['_total'] as int?,
			filtered: json['_filtered'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'mfx-es': mfxEs,
				'_total': total,
				'_filtered': filtered,
			};
}
