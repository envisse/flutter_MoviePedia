import 'dart:convert';

import 'package:flutter_movie_blocpattern/model/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> usersAPIService() async {
  var urlAPI = 'https://jsonplaceholder.typicode.com/users';
  var respone = await http.get(Uri.parse(urlAPI));

  var jsonObject = json.decode(respone.body);

  List<User> users = [];
  for (int i = 0; i < jsonObject.length; i++) {
    users.add(User.fromjson(jsonObject[i]));
  }
  return users;
}

Future<User> userAPIService(int id) async {
  var urlAPI = 'https://jsonplaceholder.typicode.com/users/' + id.toString();
  var respone = await http.get(Uri.parse(urlAPI));

  var jsonObject = json.decode(respone.body);
  print(User.fromjson(jsonObject).toString());
  return User.fromjson(jsonObject);
}
