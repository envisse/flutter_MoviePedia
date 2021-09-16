import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_blocpattern/data/models/Movie.dart';
import 'package:flutter_movie_blocpattern/data/provider/MovieProvider.dart';
import 'package:flutter_movie_blocpattern/data/repository/MovieRepository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MovieRepository movieRepository = MovieRepository();
  MoviesBloc() : super(MoviesInitial());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is MoviesInitialHomeScreen) {
      yield* _mapInitialhomeScreen();
    }
  }

  Stream<MoviesState> _mapInitialhomeScreen() async* {
    yield MovieLoading();
    try {
      List<Movie>? fetchdatanowplaying = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviesNowPlaying);
      List<Movie>? fetchdataupcoming = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviesUpcoming,itemcount: 8);
      List<Movie>? fetchdatatoprated = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviestopRated,itemcount: 11);

      if (fetchdatanowplaying != null &&
          fetchdataupcoming != null &&
          fetchdatatoprated != null) {
        yield MoviesHomeScreenSuccess(
            moviesNowPlaying: fetchdatanowplaying,
            moviesUpcoming: fetchdataupcoming,
            moviesToprated: fetchdatatoprated);
      } else {
        yield MoviesError('something wrong');
      }
    } catch (e) {
      yield MoviesError('something wrong execption');
    }
  }
}
