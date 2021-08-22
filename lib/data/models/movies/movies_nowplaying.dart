class Moviesnowplaying {
  late final String posterPath;
  late final bool adult;
  late final String overview;
  late final String releaseDate;
  late final String originalTitle;
  late final String title;
  late final String backdropPath;
  late final double popularity;
  late final int voteCount;

  Moviesnowplaying({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
  });

  factory Moviesnowplaying.fromjson(Map<String, dynamic> json) {
    return Moviesnowplaying(
      posterPath: json['poster_path'],
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      originalTitle: json['original_title'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      popularity: json['popularity'],
      voteCount: json['vote_count'],
    );
  }
}
