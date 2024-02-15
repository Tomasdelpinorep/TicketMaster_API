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

	factory BoxOfficeInfo.fromJson(Map<String, dynamic> json) => BoxOfficeInfo(
				phoneNumberDetail: json['phoneNumberDetail'] as String?,
				openHoursDetail: json['openHoursDetail'] as String?,
				acceptedPaymentDetail: json['acceptedPaymentDetail'] as String?,
				willCallDetail: json['willCallDetail'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'phoneNumberDetail': phoneNumberDetail,
				'openHoursDetail': openHoursDetail,
				'acceptedPaymentDetail': acceptedPaymentDetail,
				'willCallDetail': willCallDetail,
			};
}
