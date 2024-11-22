import 'package:expense_manager/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black, // Íconos negros globalmente para el tema claro
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primary
  ),
  // textTheme: TextTheme(),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, // Íconos negros globalmente para el tema claro
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primary,
  ),
);
