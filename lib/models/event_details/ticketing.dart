import 'all_inclusive_pricing.dart';
import 'safe_tix.dart';

class Ticketing {
	SafeTix? safeTix;
	AllInclusivePricing? allInclusivePricing;

	Ticketing({this.safeTix, this.allInclusivePricing});

	factory Ticketing.fromJson(Map<String, dynamic> json) => Ticketing(
				safeTix: json['safeTix'] == null
						? null
						: SafeTix.fromJson(json['safeTix'] as Map<String, dynamic>),
				allInclusivePricing: json['allInclusivePricing'] == null
						? null
						: AllInclusivePricing.fromJson(json['allInclusivePricing'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'safeTix': safeTix?.toJson(),
				'allInclusivePricing': allInclusivePricing?.toJson(),
			};
}
