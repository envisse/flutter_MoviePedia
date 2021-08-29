//ths is component for side menu in application
//in material design it's called "Drawer"

import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/components/text.dart';

class DrawerComponennts extends StatelessWidget {
  const DrawerComponennts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(  
      child: Container(
        color: Colors.black54,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/250?image=9',
                    ),
                    radius: 40,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextComponent(textcomp: Textcomp.heading3, text: 'Username'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextComponent(textcomp: Textcomp.body, text: 'Email'),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.movie, color: Colors.red),
              onTap: () => Navigator.pushNamed(context, '/movie'),
              title: TextComponent(textcomp: Textcomp.body, text: 'Movies'),
            ),
            ListTile(
              leading: Icon(Icons.tv, color: Colors.red),
              onTap: () => Navigator.pushNamed(context, '/tv'),
              title: TextComponent(textcomp: Textcomp.body, text: 'Tv'),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.red),
              onTap: () => Navigator.pushNamed(context, '/person'),
              title: TextComponent(textcomp: Textcomp.body, text: 'Person / Actor'),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: Colors.red),
              onTap: () => Navigator.pushReplacementNamed(context, '/logout'),
              title: TextComponent(textcomp: Textcomp.body, text: 'Logout'),
            ),
          ],
        ),
      ),

    );
  }
}
