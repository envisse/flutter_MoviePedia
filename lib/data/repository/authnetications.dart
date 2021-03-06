import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_movie_blocpattern/view/pages/base.dart';
import 'package:flutter_movie_blocpattern/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

String url = 'https://tiket.borneocorner.com/api/';
String? token;

class Authentication {
  //service for login
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

  //service login with token
  Future<bool> loginToken() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      String token = prefs.getString('token')!;

      String route = url + 'token';
      var respone = await http.post(Uri.parse(route), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ' + token,
      });
      if (respone.statusCode == 200) {
        print('success');
        return false;
      } else {
        return false;
      }
    } catch (e) {
      print('error');
      return false;
    }
  }

  //service for register
  Future<bool> register(
      String name, String email, String password, String hp) async {
    String route = url + 'register';
    var respone = await http.post(Uri.parse(route),
        body: {'email': email, 'password': password, 'hp': hp, 'nama': name});

    //error handling
    if (respone.statusCode == 403) {
      print('something wrong');
      return false;
    } else if (respone.statusCode == 422) {
      var jsonObject = json.decode(respone.body);
      var messege = jsonObject['messege'];
      print(messege.toString());
      return false;
    } else if (respone.statusCode == 200) {
      return true;
    }
    return true;
  }

  //service for logout
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
