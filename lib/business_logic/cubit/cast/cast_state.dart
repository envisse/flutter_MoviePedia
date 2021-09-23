part of 'cast_cubit.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastSuccess extends CastState {
  final Cast castdata;

  CastSuccess(this.castdata);

  @override
  List<Object> get props => [castdata];
}

class CastError extends CastState {
  final String error;

  CastError(this.error);

  @override
  List<Object> get props => [error];
}
