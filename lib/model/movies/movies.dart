class Movies {
  late final int id;
  late final String original_title;
  late final String original_language;
  late final String overview;
  late final bool adult;
  late final String release_date;
  late final double popularity;
  late final double vote_average;
  String? status;

  Movies({
    required this.id,
    required this.original_title,
    required this.original_language,
    required this.overview,
    required this.adult,
    required this.release_date,
    required this.popularity,
    required this.vote_average,
    this.status,
  });

  factory Movies.fromjson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'],
      original_title: json['original_title'],
      original_language: json['original_language'],
      overview: json['overview'],
      adult: json['adult'],
      release_date: json['release_date'],
      popularity: json['popularity'],
      vote_average: json['vote_average'],
    );
  }
}
