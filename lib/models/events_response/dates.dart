import 'start.dart';
import 'status.dart';

class Dates {
	Start? start;
	String? timezone;
	Status? status;
	bool? spanMultipleDays;

	Dates({this.start, this.timezone, this.status, this.spanMultipleDays});

	factory Dates.fromJson(Map<String, dynamic> json) => Dates(
				start: json['start'] == null
						? null
						: Start.fromJson(json['start'] as Map<String, dynamic>),
				timezone: json['timezone'] as String?,
				status: json['status'] == null
						? null
						: Status.fromJson(json['status'] as Map<String, dynamic>),
				spanMultipleDays: json['spanMultipleDays'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'start': start?.toJson(),
				'timezone': timezone,
				'status': status?.toJson(),
				'spanMultipleDays': spanMultipleDays,
			};
}
