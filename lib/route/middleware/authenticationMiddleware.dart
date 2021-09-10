import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_blocpattern/business_logic/bloc/bloc/authentication_bloc.dart';
import 'package:flutter_movie_blocpattern/view/pages/base.dart';

class AuthenticationMiddleware extends StatelessWidget {
  final Widget page;
  const AuthenticationMiddleware({Key? key, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) {   
        return AuthenticationBloc()..add(AppLoaded());
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return page;
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
