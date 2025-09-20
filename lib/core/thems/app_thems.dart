import 'package:flutter/material.dart';

final primaryColor = Color(0xff082659);

class AppThemes {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.amber,
      brightness: Brightness.light,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 300,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black, size: 30.0),
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50),
      ),
      splashColor: Colors.grey,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 30),
    ),
  );
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 30.0),
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50),
      ),
      splashColor: Colors.grey,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 30),
    ),
  );
}
