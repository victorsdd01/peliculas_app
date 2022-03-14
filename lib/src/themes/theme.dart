import 'package:flutter/material.dart';

class AppThemes{

static const Color primary = Colors.green;
static const Color darkPrimary = Colors.red;

//-------------lightTheme-------
static final lightTheme = ThemeData.light().copyWith(
  appBarTheme:  const AppBarTheme(
    //brightness:Brightness.light, //color de los iconos como wifi, señal etc...
    backgroundColor:primary,
    foregroundColor: Colors.white, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10.5),bottomRight:Radius.circular(10.5))),
  
  ),

  
    
);

}