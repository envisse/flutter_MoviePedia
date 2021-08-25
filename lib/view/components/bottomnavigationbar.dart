import 'package:flutter/material.dart';

//ths is component for bottom menu in application
//in material design it's called "Bottom navigation bar"
class Bottomnavigationbar extends StatelessWidget {
  const Bottomnavigationbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Movies'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tv series'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
      ],
      backgroundColor: Colors.black,
    );
  }
}
