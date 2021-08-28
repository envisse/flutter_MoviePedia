import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/pages/base.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (context) => HomePage());

      case ('/home'):
        return MaterialPageRoute(builder: (context) => HomePage());

      case ('/movie'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: PageList.movie));

      case ('/tv'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: PageList.tv));

      case ('/person'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: PageList.person));

      case ('/logout'):
        return MaterialPageRoute(builder: (context) => HomePage());

      case ('/login'):
        return MaterialPageRoute(builder: (context) => LoginPage());

      case ('/register'):
        return MaterialPageRoute(builder: (context) => Registerpage());

      default:
        return MaterialPageRoute(builder: (context) => NullPage());
    }
  }
}
