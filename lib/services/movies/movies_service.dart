import 'dart:convert';
import 'package:flutter_movie_blocpattern/model/movies/movies_nowplaying.dart';
import 'package:http/http.dart' as http;

String apikey = "9e16931e0d0345a1b73821552793a73a";

//service for getting movies upcoming data
Future<List<Moviesnowplaying>> moviesNowPlayingAPIservice(int page) async {
  var urlAPI =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${apikey}&page=${page}';
  var respone = await http.get(Uri.parse(urlAPI));
  var jsonObject = json.decode(respone.body);

  List<dynamic> results = (jsonObject as Map<String, dynamic>)['results'];

  List<Moviesnowplaying> moviesnowplaying = [];
  for (int i = 0; i < results.length; i++) {
    moviesnowplaying.add(Moviesnowplaying.fromjson(results[i]));
  }

  return moviesnowplaying;
}


//service for getting movies latest data