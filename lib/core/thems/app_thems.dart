import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// final primaryColor = Color(0xff082659);

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
        fontSize: 30,
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

    drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
    listTileTheme: ListTileThemeData(
      // enableFeedback: true
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(color: Colors.white),
    canvasColor: Colors.white,

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 25.0)),
      ),
    ),
    useSystemColors: true,
    primaryColor: Colors.white,
  );

  // ================================================================
  // ================================================================
  // ================================================================

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),

    drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]),
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
      bodyMedium: TextStyle(color: Colors.white, fontSize: 30),
      bodySmall: TextStyle(color: Colors.black, fontSize: 20),
      titleMedium: TextStyle(color: Colors.black, fontSize: 30),
      titleSmall: TextStyle(color: Colors.blue, fontSize: 20),
    ),
    listTileTheme: ListTileThemeData(
      // enableFeedback: true
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(color: Colors.white10),
    canvasColor: Colors.white10,

    // useSystemColors: true,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 25.0)),
      ),
    ),
    primaryTextTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    primaryColor: Colors.white10,
  );
}
