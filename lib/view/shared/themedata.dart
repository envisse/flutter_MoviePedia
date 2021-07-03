import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: _moviecolorScheme,
    scaffoldBackgroundColor: Colors.black,
    
    //theming elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25),
      ),
    ),

    //theming textform field
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black12,
      errorStyle: TextStyle(color: error),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: error),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: error),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

const ColorScheme _moviecolorScheme = ColorScheme(
  primary: primary,
  primaryVariant: primary,
  secondary: primary,
  secondaryVariant: primary,
  surface: primary,
  background: primary,
  error: error,
  onPrimary: secondary,
  onSecondary: secondary,
  onSurface: primary,
  onBackground: primary,
  onError: error,
  brightness: Brightness.dark,
);

const Color primary = Color(0xFFFF0000);
const Color secondary = Color(0xFFFFFFFF);
const Color onsurface = Color(0xFF1D1D1D);
const Color background = Color(0xFF000000);
const Color error = Color(0xFFFF9500);
