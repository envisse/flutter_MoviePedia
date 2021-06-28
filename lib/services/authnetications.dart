import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = 'http://localhost:8000/api/';

class Authentication {
  Future<String> login(String email, String password) async {
    String route = url+'login';

    var respone = await http.post(
      Uri.parse(route),
      body: {'email': email, 'password': password},
    );

    print(respone.statusCode.toString());
    return respone.statusCode.toString();
  }
}
