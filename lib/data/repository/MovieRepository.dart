import 'dart:convert';

import 'package:flutter_movie_blocpattern/data/models/Movie.dart';
import 'package:flutter_movie_blocpattern/data/provider/barrel.dart';

class MovieRepository {
  MovieProvider movieProvider = MovieProvider();

  Future<List<Movie>?> getMoviesData({required MoviesFeature moviesFeature,int? itemcount}) async {
    final rawMoviewsdata = await movieProvider.rawMoviesData(moviesFeature);

    if (rawMoviewsdata[1] == 200) {
      //i want to get data in results object
      List results = (rawMoviewsdata[0] as Map<String, dynamic>)['results'];
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

  Future<Movie?> getMovieData(int id) async {
    final rawdata = await movieProvider.rawMovieData(id);

    if (rawdata.statusCode == 200) {
      var data = json.decode(rawdata.body);
      var model  = Movie.singlefromjson(data);

      //convert runtime (minute) to hour-minute format 
      int minute = model.runtime! % 60;
      int hour = model.runtime! ~/ 60;
      String durations = '$hour h $minute m';
      model.duration = durations;
            
      return model;
    } else {
      return null;
    }
  }
}
