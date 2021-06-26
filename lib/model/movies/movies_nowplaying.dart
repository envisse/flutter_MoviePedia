class Moviesnowplaying {
  late final String poster_path;
  late final bool adult;
  late final String overview;
  late final String release_date;
  late final String original_title;
  late final String title;
  late final String backdrop_path;
  late final double popularity;
  late final int vote_count;

  Moviesnowplaying({
    required this.poster_path,
    required this.adult,
    required this.overview,
    required this.release_date,
    required this.original_title,
    required this.title,
    required this.backdrop_path,
    required this.popularity,
    required this.vote_count,
  });

  factory Moviesnowplaying.fromjson(Map<String, dynamic> json) {
    return Moviesnowplaying(
      poster_path: json['poster_path'],
      adult: json['adult'],
      overview: json['overview'],
      release_date: json['release_date'],
      original_title: json['original_title'],
      title: json['title'],
      backdrop_path: json['backdrop_path'],
      popularity: json['popularity'],
      vote_count: json['vote_count'],
    );
  }
}
