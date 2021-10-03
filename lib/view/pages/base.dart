import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_blocpattern/business_logic/cubit/cast/cast_cubit.dart';
import 'package:flutter_movie_blocpattern/business_logic/cubit/movies/movies_cubit.dart';
import 'package:flutter_movie_blocpattern/business_logic/cubit/people/people_cubit.dart';
import 'package:flutter_movie_blocpattern/data/models/CastMovie.dart';
import 'package:flutter_movie_blocpattern/data/models/CastPeople.dart';
import 'package:flutter_movie_blocpattern/data/models/Movie.dart';
import 'package:flutter_movie_blocpattern/data/models/People.dart';
import 'package:flutter_movie_blocpattern/route/args/details_args.dart';
import 'package:flutter_movie_blocpattern/view/components/button.dart';
import 'package:flutter_movie_blocpattern/view/components/card.dart';
import 'package:flutter_movie_blocpattern/view/components/text.dart';
import 'package:flutter_movie_blocpattern/view/components/textformfield.dart';
import 'package:flutter_movie_blocpattern/view/components/bottomnavigationbar.dart';
import 'package:flutter_movie_blocpattern/view/components/drawer.dart';
import 'package:flutter_movie_blocpattern/view/shared/dimens.dart';
import 'package:carousel_slider/carousel_slider.dart';


//list of pages
part 'home_page/home_page.dart';
part 'home_page/screen_page.dart';
part 'home_page/profile_page.dart';
part 'home_page/actor_page.dart';
part 'register_page.dart';
part 'login_page.dart';
part 'Null_page.dart';
part 'authentication_page.dart';
part 'spesific_page.dart';
part 'search_page.dart';
part 'details_page/screen_page.dart';
part 'details_page/movie_details.dart';
part 'details_page/actor_details.dart';