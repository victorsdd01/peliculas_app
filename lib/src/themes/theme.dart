import 'package:flutter/material.dart';

class AppThemes {
  static const Color primary = Color.fromARGB(255, 32, 32, 32);
  static const Color darkPrimary = Colors.black;
  static const Color transparentColor = Colors.transparent;
  static const Color white = Colors.white;

//-------------lightTheme-------
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: transparentColor.withOpacity(0.3),
      foregroundColor: Colors.white,
      //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10.5),bottomRight:Radius.circular(10.5))),
    ),
  );
}
