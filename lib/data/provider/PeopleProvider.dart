part of 'barrel.dart';

class PeopleProvider {
  String apikeys = '9e16931e0d0345a1b73821552793a73a';

  Future<http.Response> rawDataPeople(int id) async{
    String link = 'https://api.themoviedb.org/3/person/$id?api_key=$apikeys&language=en-US';
    return (await http.get(Uri.parse(link)));
  }

  Future<http.Response> rawDataPeoples(int page) async{
    String link = 'https://api.themoviedb.org/3/person/popular?api_key=$apikeys&language=en-US&page=$page';
    return (await http.get(Uri.parse(link)));
  }
}