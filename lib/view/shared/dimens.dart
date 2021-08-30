import 'package:flutter/material.dart';

class Dimens {
  //margin padding
  static const double sizedbox_height = 15;
  static const double margin_global = 24;

  //text size
  static const double size_heading1 = 48;
  static const double size_heading2 = 36;
  static const double size_heading3 = 24;
  static const double size_heading4 = 18;
  static const double size_body = 14;

  //color
  static const Color color_primary = Color(0xFFFF0000);
  static const Color color_secondary = Color(0xFFFFFFFF);
  static const Color color_onsurface = Color(0xFF1D1D1D);
  static const Color color_background = Color(0xFF000000);
  static const Color color_error = Color(0xFFFF9500);

  //color schema
  static const ColorScheme moviecolorScheme = ColorScheme(
    primary: color_primary,
    primaryVariant: color_primary,
    secondary: color_primary,
    secondaryVariant: color_primary,
    surface: color_primary,
    background: color_primary,
    error: color_error,
    onPrimary: color_secondary,
    onSecondary: color_secondary,
    onSurface: color_primary,
    onBackground: color_primary,
    onError: color_error,
    brightness: Brightness.dark,
  );
}
