import 'dart:convert';

import 'package:flutter_movie_blocpattern/data/models/Cast.dart';
import 'package:flutter_movie_blocpattern/data/provider/CastProvider.dart';

class CastRepository {
  CastProvider castProvider = CastProvider();
  
  Future<Cast?> getCastData(int id) async {
    final rawdata = await castProvider.rawcCastData(id);
    if (rawdata.statusCode == 200) {
      var data = json.decode(rawdata.body);
      var model = Cast.fromJson(data);
      
      return model;
    }
    else{
      return null;
    }
  }
}
