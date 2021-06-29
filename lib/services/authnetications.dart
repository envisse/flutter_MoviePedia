import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/main.dart';
import 'package:flutter_movie_blocpattern/view/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String url = 'http://10.0.2.2:8000/api/';
String? token;

class Authentication {
  Future login(String email, String password, BuildContext context) async {
    String route = url + 'login';

    var respone = await http.post(
      Uri.parse(route),
      body: {'email': email, 'password': password},
    );

    if (respone.statusCode != 200) {
      print(respone.statusCode.toString());
      return respone.statusCode.toString();
    }
    var jsonObject = json.decode(respone.body);

    //saving to internal memory
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', jsonObject['access_token'].toString());
    prefs.setInt('user_id', jsonObject['user_id']);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
    print(respone.statusCode.toString());
    print(prefs.getString('token'));

    return respone.statusCode.toString();
  }

  Future<String> loginToken() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      String token = prefs.getString('token')!;

      String route = url + 'token';
      var respone = await http.post(Uri.parse(route), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ' + token,
      });
      if (respone.statusCode != 200) {
        print('error');
        return 'nope';
      } else {
        print('success');
        return 'ok';
      }
    } catch (e) {
      print('error');
      return 'nope';
    }
  }

  Future logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String userid = prefs.getInt('user_id').toString();

    String route = url + 'logout';

    try {
      await http.post(
        Uri.parse(route),
        body: {'user_id': userid},
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
      print('logged out');
      return true;
    } catch (e) {
      print('failed');
      return false;
    }
  }
}
