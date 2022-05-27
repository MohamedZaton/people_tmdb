import 'package:flutter/material.dart';
import 'package:people_tmdb/tools/colors.dart';

ThemeData? buildLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
      textTheme: lightTextTheme(),
      backgroundColor: kBackgdDarkColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: kBgFloatBtnLightColor),
      scaffoldBackgroundColor: kBackgdDarkColor);
}

TextTheme lightTextTheme() {
  return TextTheme(
    headline3:
        TextStyle(fontWeight: FontWeight.bold).apply(color: kTextLightColor),
    headline4:
        TextStyle(fontWeight: FontWeight.bold).apply(color: kTextLightColor),
    headline5:
        TextStyle(fontWeight: FontWeight.bold).apply(color: kTextLightColor),
    subtitle1: TextStyle().apply(color: kSubTextColor),
    bodyText2: TextStyle().apply(color: kTextLightColor),
    bodyText1: TextStyle().apply(color: kTextLightColor),
  );
}

ThemeData? buildDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
      textTheme: darkTextTheme(),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white);
}

TextTheme darkTextTheme() {
  return TextTheme(
    headline3: TextStyle(fontWeight: FontWeight.bold).apply(color: kTextDark),
    headline4: TextStyle(fontWeight: FontWeight.bold).apply(color: kTextDark),
    headline5: TextStyle(fontWeight: FontWeight.bold).apply(color: kTextDark),
    bodyText2: TextStyle().apply(color: kTextDark),
    bodyText1: TextStyle().apply(color: kTextDark),
    subtitle1: TextStyle().apply(color: kSubTextColor),
  );
}
