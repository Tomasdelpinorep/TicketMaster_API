import 'public.dart';

class Sales {
	Public? public;

	Sales({this.public});

	factory Sales.fromJson(Map<String, dynamic> json) => Sales(
				public: json['public'] == null
						? null
						: Public.fromJson(json['public'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'public': public?.toJson(),
			};
}
