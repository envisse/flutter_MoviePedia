
import 'package:flutter_movie_blocpattern/data/models/User.dart';

abstract class AuthenticationService {
  Future<User?> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void>? signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<User?> getCurrentUser() async {
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay

    if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
      
    }
    return User('Test User', email);
  }

  @override
  Future<void>? signOut() {
    return null;
  }
}
