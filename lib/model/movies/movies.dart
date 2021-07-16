class Movies {
  late final int id;
  late final String originalTitle;
  late final String originalLanguage;
  late final String overview;
  late final bool adult;
  late final String relaseDate;
  late final double popularity;
  late final double voteAverage;
  String? status;

  Movies({
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.overview,
    required this.adult,
    required this.relaseDate,
    required this.popularity,
    required this.voteAverage,
    this.status,
  });

  factory Movies.fromjson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      adult: json['adult'],
      relaseDate: json['release_date'],
      popularity: json['popularity'],
      voteAverage: json['vote_average'],
    );
  }
}
