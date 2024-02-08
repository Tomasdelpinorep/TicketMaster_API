import 'dart:convert';

class Dma {
	int? id;

	Dma({this.id});

	factory Dma.fromVenueResponse(Map<String, dynamic> data) => Dma(
				id: data['id'] as int?,
			);

	Map<String, dynamic> toVenueResponse() => {
				'id': id,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dma].
	factory Dma.fromJson(String data) {
		return Dma.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Dma] to a JSON string.
	String toJson() => json.encode(toVenueResponse());
}
