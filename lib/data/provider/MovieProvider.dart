part of 'barrel.dart';

enum MoviesFeature {
  MoviesNowPlaying,
  MoviesPopular,
  MoviesUpcoming,
  MoviestopRated,
}

//#1 approach
class MovieProvider {
  String apikeys = '9e16931e0d0345a1b73821552793a73a';

  Future rawMoviesData(MoviesFeature moviesFeature) async {
    late String link;

    if (moviesFeature == MoviesFeature.MoviesNowPlaying) {
      link =
          'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikeys&language=en-US&page=1';
    } else if (moviesFeature == MoviesFeature.MoviesPopular) {
      link =
          'https://api.themoviedb.org/3/movie/popular?api_key=$apikeys&language=en-US&page=1';
    } else if (moviesFeature == MoviesFeature.MoviesUpcoming) {
      link =
          'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikeys&language=en-US&page=1';
    } else if (moviesFeature == MoviesFeature.MoviestopRated) {
      link =
          'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikeys&language=en-US&page=1';
    } else {
      return null;
    }

    //executed
    try {
      var rawmovies = await http.get(
        Uri.parse(link),
      );
      var jsonmovies = json.decode(rawmovies.body);
      var statuscode = rawmovies.statusCode;
      return [jsonmovies, statuscode];
    } catch (e) {
      return (e.toString() + ' : Unexpected error');
    }
  }

  //#2 approach
  //mending begini kayaknya
  Future<http.Response> rawMovieData(int id) async {
    String link =
        'https://api.themoviedb.org/3/movie/$id?api_key=$apikeys&language=en-US';
    return (await http.get(Uri.parse(link)));
  }
}
