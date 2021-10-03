import 'dart:convert';

import 'package:flutter_movie_blocpattern/data/models/CastMovie.dart';
import 'package:flutter_movie_blocpattern/data/models/CastPeople.dart';
import 'package:flutter_movie_blocpattern/data/provider/barrel.dart';

class CastRepository {
  CastProvider castProvider = CastProvider();
  
  Future<CastPeople?> getCastDataPeople(int id) async {
    final rawdata = await castProvider.rawCastDataPeople(id);
    if (rawdata.statusCode == 200) {  
      return CastPeople.fromJson(json.decode(rawdata.body));
    }
      return null;
  }

  Future<CastMovie?> getCastDataMovie(int id) async{
    final rawdata = await castProvider.rawCastDataMovie(id);
    if (rawdata.statusCode == 200) {
      return (CastMovie.fromjson(json.decode(rawdata.body)));
    }
    return null;
  }
}
