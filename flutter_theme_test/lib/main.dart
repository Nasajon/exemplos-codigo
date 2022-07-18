import 'package:flutter/material.dart';
import 'package:flutter_theme_test/screens/home_page.dart';
import 'package:flutter_theme_test/themes/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeSwitch = ThemeController.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: themeSwitch,
        builder: (context, child) {
          return MaterialApp(
            title: 'Theme Test',
            theme: themeSwitch.themeMode,
            home: HomePage(),
          );
        });
  }
}
