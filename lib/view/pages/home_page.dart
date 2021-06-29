import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/services/authnetications.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Authentication authentication = Authentication();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Ini Home Page'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => authentication.logout(context),
              child: Text('Logout'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
