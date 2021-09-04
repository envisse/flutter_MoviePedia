import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/route/args/details_args.dart';
import 'package:flutter_movie_blocpattern/view/pages/base.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (context) => Screenpage());

      case ('/home'):
        return MaterialPageRoute(builder: (context) => Screenpage());

      case ('/movie'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: SpesificPageList.movie));

      case ('/movie_detail'):
        final detailsargs = routeSettings.arguments as DetailsArgs; 
        return MaterialPageRoute(
            builder: (context) => DetailsPage(pageList: DetailsPageList.movie,id: detailsargs.id,));

      case ('/tv'):
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: SpesificPageList.tv));

      case ('/person'): //actor ?
        return MaterialPageRoute(
            builder: (context) => SpesificPage(page: SpesificPageList.person));

      case ('/person_detail'):
        final detailsargs = routeSettings.arguments as DetailsArgs; 
        return MaterialPageRoute(
            builder: (context) => DetailsPage(pageList: DetailsPageList.actor,id: detailsargs.id,));

       case('/search'):
         return MaterialPageRoute(builder: (context) => SearchPage(),);

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
