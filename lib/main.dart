import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/pages/login_page.dart';
import 'package:flutter_movie_blocpattern/view/shared/themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AuthenticationChecker(),
      ),
      theme: theme(),
    );
  }
}
