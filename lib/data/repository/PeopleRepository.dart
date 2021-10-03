import 'dart:convert';
import 'package:flutter_movie_blocpattern/data/models/People.dart';
import 'package:flutter_movie_blocpattern/data/provider/barrel.dart';

class PeopleRepository {
  PeopleProvider _peopleProvider = PeopleProvider();

  Future<People?> getPeopleData(int id) async {
    final rawdata = await _peopleProvider.rawDataPeople(id);
    if (rawdata.statusCode == 200) {
      return People.fromjson(json.decode(rawdata.body));
    }
    return null;
  }

  Future<List<People>?> getPeoplesData(int page) async{
    final rawdata = await _peopleProvider.rawDataPeoples(page);
    if (rawdata.statusCode == 200) {
      var data = json.decode(rawdata.body);     
      List results = (data as Map<String, dynamic>)['results'];
      List<People> peoples = [];
      results.forEach((element) => peoples.add(People.fromjson(element)));
      return peoples;
    }
    return null;
  }
}