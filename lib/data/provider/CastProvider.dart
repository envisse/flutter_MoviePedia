part of 'barrel.dart';

class CastProvider {
  String apikeys = '9e16931e0d0345a1b73821552793a73a';
  
  Future<http.Response> rawCastDataPeople(int id) async{
    String link = 'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apikeys&language=en-US';

    return (await http.get(Uri.parse(link)));
  }
  
  Future<http.Response> rawCastDataMovie(int id) async{
    String link = 'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apikeys&language=en-US';
    return (await http.get(Uri.parse(link)));
  }
}
