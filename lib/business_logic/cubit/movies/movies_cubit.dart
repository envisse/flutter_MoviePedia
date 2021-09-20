import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_blocpattern/data/models/Movie.dart';
import 'package:flutter_movie_blocpattern/data/provider/MovieProvider.dart';
import 'package:flutter_movie_blocpattern/data/repository/MovieRepository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MovieRepository movieRepository = MovieRepository();
  MoviesCubit() : super(MoviesInitial());

  void initialhomescreen() async {
    emit(MoviesLoading());
    try {
      List<Movie>? fetchdatapopular = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviesPopular, itemcount: 4);
      List<Movie>? fetchdatanowplaying = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviesNowPlaying, itemcount: 8);
      List<Movie>? fetchdataupcoming = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviesUpcoming, itemcount: 8);
      List<Movie>? fetchdatatoprated = await movieRepository.getMoviesData(
          moviesFeature: MoviesFeature.MoviestopRated, itemcount: 8);

      if (fetchdatapopular != null &&
          fetchdatanowplaying != null &&
          fetchdataupcoming != null &&
          fetchdatatoprated != null) {
        emit(MoviesHomeScreenSuccess(
            moviespopular: fetchdatapopular,
            moviesNowPlaying: fetchdatanowplaying,
            moviesUpcoming: fetchdataupcoming,
            moviesToprated: fetchdatatoprated));
      } else {
        emit(MoviesError('data not found'));
      }
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  void initmoviedetail(int id) async {
    emit(MoviesLoading());
    try {
      Movie? fetchmoviedetail = await movieRepository.getMovieData(id);
      if (fetchmoviedetail != null) {
        emit(MovieSuccess(fetchmoviedetail));
      } else {
        emit(MoviesError('data not found'));
      }      
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
