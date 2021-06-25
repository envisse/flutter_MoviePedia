import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/shared/StringComponent.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringComponent.appbarMoviePage),),
    );
  }
}