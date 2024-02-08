import 'presale.dart';
import 'public.dart';

class Sales {
	Public? public;
	List<Presale>? presales;

	Sales({this.public, this.presales});

	factory Sales.fromJson(Map<String, dynamic> json) => Sales(
				public: json['public'] == null
						? null
						: Public.fromJson(json['public'] as Map<String, dynamic>),
				presales: (json['presales'] as List<dynamic>?)
						?.map((e) => Presale.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'public': public?.toJson(),
				'presales': presales?.map((e) => e.toJson()).toList(),
			};
}
