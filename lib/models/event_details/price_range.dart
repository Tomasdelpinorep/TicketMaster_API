class PriceRange {
	String? type;
	String? currency;
	int? min;
	int? max;

	PriceRange({this.type, this.currency, this.min, this.max});

	factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
				type: json['type'] as String?,
				currency: json['currency'] as String?,
				min: json['min'] as int?,
				max: json['max'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'currency': currency,
				'min': min,
				'max': max,
			};
}
