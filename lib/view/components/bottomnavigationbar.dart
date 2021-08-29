import 'package:flutter/material.dart';

//ths is component for bottom menu in application
//in material design it's called "Bottom navigation bar"
class Bottomnavigationbar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? ontap;
  const Bottomnavigationbar({Key? key, this.ontap,required this.currentIndex}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: ontap,
      currentIndex: currentIndex,
      elevation: 1,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      backgroundColor: Colors.black,
    );
  }
}
