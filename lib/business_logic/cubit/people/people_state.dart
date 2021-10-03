part of 'people_cubit.dart';

abstract class PeopleState extends Equatable {
  const PeopleState();

  @override
  List<Object> get props => [];
}

class PeopleInitial extends PeopleState {}

class PeopleLoading extends PeopleState {}

class PeopleSuccess extends PeopleState {
  final People people;
  PeopleSuccess(this.people);

  @override
  List<Object> get props => [people];
}

class PeoplesSuccess extends PeopleState {
  final List<People> peoples;
  PeoplesSuccess(this.peoples);

  @override
  List<Object> get props => [peoples];
}

class PeopleError extends PeopleState {
  final String message;
  PeopleError(this.message);

  @override
  List<Object> get props => [message];
}
