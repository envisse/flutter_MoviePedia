import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/services/authnetications.dart';

import 'home_page.dart';

class AuthenticationChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    return FutureBuilder(
      future: authentication.loginToken(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == 'nope') {
          print(snapshot.data.toString());
          return LoginPage();
        } else {
          print(snapshot.data.toString());
          return HomePage();
        }
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  var authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Please sign in to continue',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              TextFormField(
                controller: _email,
              ),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(hintText: 'password'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => authentication.login(
                        _email.text, _password.text, context),
                    child: Text('LOGIN'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
