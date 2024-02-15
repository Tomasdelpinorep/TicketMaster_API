class PriceRange {
	String? type;
	String? currency;
	double? min;
	double? max;

	PriceRange({this.type, this.currency, this.min, this.max});

	factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
				type: json['type'] as String?,
				currency: json['currency'] as String?,
				min: json['min'] as double?,
				max: json['max'] as double?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'currency': currency,
				'min': min,
				'max': max,
			};
}
