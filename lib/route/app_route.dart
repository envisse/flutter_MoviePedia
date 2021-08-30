import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/route/args/details_args.dart';
import 'package:flutter_movie_blocpattern/view/pages/base.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final detailsArgs = routeSettings.arguments as DetailsArgs; 
    switch (routeSettings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (context) => Screenpage());

      case ('/home'):
        return MaterialPageRoute(builder: (context) => Screenpage());

      case ('/movie'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: SpesificPageList.movie));

      case ('/movie_detail'):
        return MaterialPageRoute(
            builder: (context) => DetailsPage(pageList: DetailsPageList.movie,id: detailsArgs.id,));

      case ('/tv'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: SpesificPageList.tv));

      case ('/person'): //actor ?
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: SpesificPageList.person));

      case ('/person_detail'):
        return MaterialPageRoute(
            builder: (context) => DetailsPage(pageList: DetailsPageList.actor,id: detailsArgs.id,));

      case ('/logout'):
        return MaterialPageRoute(builder: (context) => LoginPage());

      case ('/login'):
        return MaterialPageRoute(builder: (context) => LoginPage());

      case ('/register'):
        return MaterialPageRoute(builder: (context) => Registerpage());

      default:
        return MaterialPageRoute(builder: (context) => NullPage());
    }
  }
}
