//model for credits movie in single people
import 'package:flutter_movie_blocpattern/data/models/Movie.dart';

class CastMovie {
  List<Movie> movies;

  CastMovie({required this.movies});

  factory CastMovie.fromjson(Map<String, dynamic> json) {
    return CastMovie(
        movies: List<Movie>.from(
            json["cast"].map((x) => Movie.castfromjson(x))));
  }
}