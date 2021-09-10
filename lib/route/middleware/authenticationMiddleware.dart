import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/pages/base.dart';

class AuthenticationMiddleware extends StatelessWidget {
  final Widget page;
  const AuthenticationMiddleware({Key? key, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 1;
    if (i == 1) {
      return LoginPage();
    } else {
      return page;
    }
  }
}
