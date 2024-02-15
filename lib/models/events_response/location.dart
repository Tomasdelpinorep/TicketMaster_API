class Location {
	String? longitude;
	String? latitude;

	Location({this.longitude, this.latitude});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				longitude: json['longitude'] as String?,
				latitude: json['latitude'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'longitude': longitude,
				'latitude': latitude,
			};
}
