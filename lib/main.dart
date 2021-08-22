import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/route/app_route.dart';
import 'package:flutter_movie_blocpattern/view/shared/Theme.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }
}
