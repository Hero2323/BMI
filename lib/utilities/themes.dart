import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
    primarySwatch: Colors.blue,
    backgroundColor: Colors.teal[100],
    brightness: Brightness.light,
    primaryColor: Colors.teal[600],
    secondaryHeaderColor: Colors.blueGrey[600],
    cardColor: Colors.lightBlueAccent,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.white),
    ));

// Dark Theme
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  primaryColor: Colors.grey[600],
  backgroundColor: Colors.black,
  cardColor: Colors.grey[800],
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.black),
  ),
);
