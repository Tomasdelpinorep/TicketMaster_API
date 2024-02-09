import 'dart:convert';

class BoxOfficeInfo {
	String? phoneNumberDetail;
	String? openHoursDetail;
	String? acceptedPaymentDetail;
	String? willCallDetail;

	BoxOfficeInfo({
		this.phoneNumberDetail, 
		this.openHoursDetail, 
		this.acceptedPaymentDetail, 
		this.willCallDetail, 
	});

	factory BoxOfficeInfo.fromVenueResponse(Map<String, dynamic> data) {
		return BoxOfficeInfo(
			phoneNumberDetail: data['phoneNumberDetail'] as String?,
			openHoursDetail: data['openHoursDetail'] as String?,
			acceptedPaymentDetail: data['acceptedPaymentDetail'] as String?,
			willCallDetail: data['willCallDetail'] as String?,
		);
	}



	Map<String, dynamic> toVenueResponse() => {
				'phoneNumberDetail': phoneNumberDetail,
				'openHoursDetail': openHoursDetail,
				'acceptedPaymentDetail': acceptedPaymentDetail,
				'willCallDetail': willCallDetail,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BoxOfficeInfo].
	factory BoxOfficeInfo.fromJson(String data) {
		return BoxOfficeInfo.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [BoxOfficeInfo] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
