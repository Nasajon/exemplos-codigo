import 'package:flutter/material.dart';

final AnaTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 69, 155),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor:
        MaterialStateProperty.all<Color>(Color.fromARGB(255, 234, 234, 234)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 255, 205, 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
  ),
);
