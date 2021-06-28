import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/services/movies/movies_service.dart';
import 'package:flutter_movie_blocpattern/services/user_service.dart';
import 'package:flutter_movie_blocpattern/view/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
