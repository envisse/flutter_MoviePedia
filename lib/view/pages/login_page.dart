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
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'LOGIN',
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(hintText: 'username'),
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(hintText: 'password'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () =>
                  authentication.login(_email.text, _password.text, context),
              child: Text('LOGIN'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => authentication.loginToken(),
              child: Text('LOGIN with token'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => authentication.logout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

