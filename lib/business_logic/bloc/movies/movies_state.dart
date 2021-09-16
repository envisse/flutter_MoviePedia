part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MovieLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<Movie> movies;

  MoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

//state many movies data in home screen
class MoviesHomeScreenSuccess extends MoviesState {
  final List<Movie> moviesNowPlaying;
  final List<Movie> moviesUpcoming;
  final List<Movie> moviesToprated;

  MoviesHomeScreenSuccess(
      {required this.moviesNowPlaying,
      required this.moviesUpcoming,
      required this.moviesToprated});

  @override
  List<Object> get props => [moviesNowPlaying, moviesUpcoming, moviesToprated];
}

class MoviesError extends MoviesState {
  final String error;

  MoviesError(this.error);

  @override
  List<Object> get props => [error];
}
