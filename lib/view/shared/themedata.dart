import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/shared/dimens.dart';


final Color textcolor = Dimens.color_secondary;

ThemeData theme() {
  return ThemeData(
    colorScheme: Dimens.moviecolorScheme,
    scaffoldBackgroundColor: Colors.black,

    //BUTTON
    //theming elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25),
      ),
    ),
    //theming outlinedbutton
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape:
            new RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 25),
      ),
    ),

    //FORMFIELD
    //theming textform field
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black12,
      errorStyle: TextStyle(color: Dimens.color_error),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Dimens.color_error),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Dimens.color_error),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    //TEXT
    //theming textstyle for
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: Dimens.size_heading1,fontWeight: FontWeight.normal,color: textcolor),
      headline2: TextStyle(fontSize: Dimens.size_heading2,fontWeight: FontWeight.normal,color: textcolor),
      headline3: TextStyle(fontSize: Dimens.size_heading3,fontWeight: FontWeight.normal,color: textcolor),
      headline4: TextStyle(fontSize: Dimens.size_heading4,fontWeight: FontWeight.normal,color: textcolor),
      bodyText1: TextStyle(fontSize: Dimens.size_body,fontWeight: FontWeight.normal,color: textcolor),
    ),
  );
}



