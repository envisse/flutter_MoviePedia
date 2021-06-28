import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/services/authnetications.dart';

class AuthenticationChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
                  authentication.login(_email.text, _password.text),
              child: Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
