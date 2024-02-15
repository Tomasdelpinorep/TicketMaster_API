import 'genre.dart';
import 'segment.dart';
import 'sub_genre.dart';

class Classification {
	bool? primary;
	Segment? segment;
	Genre? genre;
	SubGenre? subGenre;
	bool? family;

	Classification({
		this.primary, 
		this.segment, 
		this.genre, 
		this.subGenre, 
		this.family, 
	});

	factory Classification.fromJson(Map<String, dynamic> json) {
		return Classification(
			primary: json['primary'] as bool?,
			segment: json['segment'] == null
						? null
						: Segment.fromJson(json['segment'] as Map<String, dynamic>),
			genre: json['genre'] == null
						? null
						: Genre.fromJson(json['genre'] as Map<String, dynamic>),
			subGenre: json['subGenre'] == null
						? null
						: SubGenre.fromJson(json['subGenre'] as Map<String, dynamic>),
			family: json['family'] as bool?,
		);
	}



	Map<String, dynamic> toJson() => {
				'primary': primary,
				'segment': segment?.toJson(),
				'genre': genre?.toJson(),
				'subGenre': subGenre?.toJson(),
				'family': family,
			};
}
