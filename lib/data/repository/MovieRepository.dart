import 'package:flutter_movie_blocpattern/data/models/Movie.dart';
import 'package:flutter_movie_blocpattern/data/provider/MovieProvider.dart';

class MovieRepository {
  MovieProvider movieProvider = MovieProvider();

  Future<List<Movie>?> getMoviesData({required MoviesFeature moviesFeature,int? itemcount}) async {
    final rawMoviewsdata = await movieProvider.rawMoviesData(moviesFeature);

    if (rawMoviewsdata[1] == 200) {
      //i want to get data in results object
      List results =
          (rawMoviewsdata[0] as Map<String, dynamic>)['results'];
      List<Movie> movies = [];

      int amount = itemcount ?? results.length;
      for (var i = 0; i < amount; i++) {
        movies.add(Movie.fromjson(results[i]));
      }

      return movies;
    } else {
      return null;
    }
  }
}
