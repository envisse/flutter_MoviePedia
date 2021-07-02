import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: Colors.amber,
      scaffoldBackgroundColor: Colors.black,
      accentColor: Colors.amber,
      textTheme: TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        headline3: TextStyle(),
        headline2: TextStyle(),
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.red),
      ),
      iconTheme: IconThemeData(color: Colors.amber),
      inputDecorationTheme: InputDecorationTheme());
}
