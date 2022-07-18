import 'package:flutter/material.dart';

final ErpTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 91, 182),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ),
  dataTableTheme: DataTableThemeData(
    dividerThickness: 3,
    headingRowColor:
        MaterialStateProperty.all<Color>(Color.fromARGB(255, 194, 194, 194)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 0, 69, 155),
    shape: CircleBorder(),
    elevation: 20,
  ),
  cardTheme: CardTheme(
    margin: EdgeInsets.all(8.0),
    shadowColor: Color.fromARGB(255, 0, 69, 155),
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
  ),
);
