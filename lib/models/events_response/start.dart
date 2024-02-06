class Start {
	String? localDate;
	String? localTime;
	String? dateTime;
	bool? dateTbd;
	bool? dateTba;
	bool? timeTba;
	bool? noSpecificTime;

	Start({
		this.localDate, 
		this.localTime, 
		this.dateTime, 
		this.dateTbd, 
		this.dateTba, 
		this.timeTba, 
		this.noSpecificTime, 
	});

	factory Start.fromJson(Map<String, dynamic> json) => Start(
				localDate: json['localDate'] as String?,
				localTime: json['localTime'] as String?,
				dateTime: json['dateTime'] as String?,
				dateTbd: json['dateTBD'] as bool?,
				dateTba: json['dateTBA'] as bool?,
				timeTba: json['timeTBA'] as bool?,
				noSpecificTime: json['noSpecificTime'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'localDate': localDate,
				'localTime': localTime,
				'dateTime': dateTime,
				'dateTBD': dateTbd,
				'dateTBA': dateTba,
				'timeTBA': timeTba,
				'noSpecificTime': noSpecificTime,
			};
}
