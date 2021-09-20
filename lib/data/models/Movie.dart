class Movie {
  late final int id;
  late final String title;
  late final String originalLanguage;
  late final String releaseDate;
  late final bool adult;
  late final String overview;
  late final String posterPath;
  final Genre? genre;

  Movie({
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.releaseDate,
    required this.adult,
    required this.overview,
    required this.posterPath,
    this.genre,
  });

  factory Movie.fromjson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      originalLanguage: json['original_language'],
      releaseDate: json['release_date'],
      adult: json['adult'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  factory Movie.singlefromjson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      originalLanguage: json['original_language'],
      releaseDate: json['release_date'],
      adult: json['adult'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      genre: Genre.fromjson(json['genres']),
    );
  }
}

class Genre {
  late final int id;
  late final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromjson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
