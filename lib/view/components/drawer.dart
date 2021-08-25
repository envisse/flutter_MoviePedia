//ths is component for side menu in application
//in material design it's called "Drawer"

import 'package:flutter/material.dart';

class DrawerComponennts extends StatelessWidget {
  const DrawerComponennts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Header',
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Item 1'),
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Item 2'),
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text('Item 3'),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Label',
            ),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Item A'),
          ),
        ],
      ),
    );
  }
}
