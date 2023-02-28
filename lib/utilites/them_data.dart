import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color primary = const Color(0xFF004182);
  static Color blackColor = const Color.fromARGB(255, 24, 24, 24);
  static Color wightColor = Colors.white;
  static Color containerColor = const Color.fromARGB(255, 65, 64, 64);
  static Color containerLighterColor =const  Color.fromARGB(255, 143, 141, 141);
  static Color darkYelowColor =const Color.fromARGB(255, 232, 207, 77);

  static ThemeData shopThemData = ThemeData(
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: primary),
    primaryColor: primary,
    cardColor: darkYelowColor,
    scaffoldBackgroundColor: primary,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 18, color: wightColor),
      headline2: TextStyle(fontSize: 24, color: wightColor, fontWeight: FontWeight.bold),
    )
  );
}
