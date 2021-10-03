part of 'cast_cubit.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastSuccessPeople extends CastState {
  final CastPeople castdata;
  CastSuccessPeople(this.castdata);

  @override
  List<Object> get props => [castdata];
}

class CastSuccessMovie extends CastState {
  final CastMovie castMovie;
  CastSuccessMovie(this.castMovie);

  @override
  List<Object> get props => [castMovie];
}

class CastError extends CastState {
  final String error;
  CastError(this.error);

  @override
  List<Object> get props => [error];
}
