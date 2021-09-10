import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_movie_blocpattern/data/models/User.dart';
import 'package:equatable/equatable.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  // final AuthenticationService _authenticationService;

  AuthenticationBloc()
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoaded(event);
    }

    if (event is UserLoggedin) {
      yield* _mapUserLoggedin(event);
    }

    if (event is UserLoggedout) {
      yield* _mapUserLoggedout(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoaded(AppLoaded event) async* {
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      // final currentUser = await _authenticationService.getCurrentUser();
      final currentUser = null;
      if (currentUser != null) {
        yield AuthenticationAuthenticated(user: currentUser);
      } else {
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(message: 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedin(UserLoggedin event) async* {
    yield AuthenticationAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedout(UserLoggedout event) async* {
    yield AuthenticationNotAuthenticated();
  }
}
