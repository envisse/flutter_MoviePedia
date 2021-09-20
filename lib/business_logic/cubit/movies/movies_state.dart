part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesHomeScreenSuccess extends MoviesState {
  final List<Movie> moviespopular;
  final List<Movie> moviesNowPlaying;
  final List<Movie> moviesUpcoming;
  final List<Movie> moviesToprated;

  MoviesHomeScreenSuccess(
      {required this.moviespopular,
      required this.moviesNowPlaying,
      required this.moviesUpcoming,
      required this.moviesToprated});

  @override
  List<Object> get props => [moviesToprated, moviesNowPlaying, moviesUpcoming, moviesToprated];
}

class MovieSuccess extends MoviesState{
  final Movie moviedetail;

  MovieSuccess(this.moviedetail);

    @override
  List<Object> get props => [moviedetail]; 
}

class MoviesLoading extends MoviesState {}


class MoviesError extends MoviesState {
  final String error;

  MoviesError(this.error);

  @override
  List<Object> get props => [error];
}
