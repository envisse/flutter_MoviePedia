import 'dart:convert';
import 'package:flutter_movie_blocpattern/model/movies/movies.dart';
import 'package:http/http.dart' as http;

String apikey = "9e16931e0d0345a1b73821552793a73a";

//service for getting movies now playing data
Future<List<Movies>> moviesNowPlayingAPIservice(int page) async {
  var urlAPI =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey&page=$page';
  var respone = await http.get(Uri.parse(urlAPI));
  var jsonObject = json.decode(respone.body);

  List<dynamic> results = (jsonObject as Map<String, dynamic>)['results'];

  List<Movies> moviesnowplaying = [];
  for (int i = 0; i < results.length; i++) {
    moviesnowplaying.add(Movies.fromjson(results[i]));
  }

  return moviesnowplaying;
}

//service for getting movies upcoming data
Future<List<Movies>> moviesUpocmingAPIservice(int page) async {
  var urlAPI = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=$page';
  var respone = await http.get(Uri.parse(urlAPI));
  var jsonobject = json.decode(respone.body);

  List<dynamic> results = (jsonobject as Map<String, dynamic>)['results'];

  List<Movies> movieupcoming = [];
  for (var i = 0; i < results.length; i++) {
    movieupcoming.add(Movies.fromjson(jsonobject[i]));
  }
  return movieupcoming;
}

//service for getting movies popular data
Future<List<Movies>> moviesPopularAPIservice(int page) async {
  var urlAPI = 'https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US&page=$page';
  var respone = await http.get(Uri.parse(urlAPI));
  var jsonobject = json.decode(respone.body);

  List<dynamic> results = (jsonobject as Map<String, dynamic>)['results'];

  List<Movies> moviepopular = [];
  for (var i = 0; i < results.length; i++) {
    moviepopular.add(Movies.fromjson(jsonobject[i]));
  }
  return moviepopular;
}

//service for getting movies top rated data
Future<List<Movies>> moviesTopRatedAPIservice(int page) async {
  var urlAPI = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=$page';
  var respone = await http.get(Uri.parse(urlAPI));
  var jsonobject = json.decode(respone.body);

  List<dynamic> results = (jsonobject as Map<String, dynamic>)['results'];

  List<Movies> movietoprated = [];
  for (var i = 0; i < results.length; i++) {
    movietoprated.add(Movies.fromjson(jsonobject[i]));
  }
  return movietoprated;
}