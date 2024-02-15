class Dma {
	int? id;

	Dma({this.id});

	factory Dma.fromJson(Map<String, dynamic> json) => Dma(
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
			};
}
