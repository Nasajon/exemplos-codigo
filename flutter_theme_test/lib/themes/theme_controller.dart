import 'package:flutter/material.dart';
import 'package:flutter_theme_test/themes/ana_theme.dart';
import 'package:flutter_theme_test/themes/erp_theme.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController instance = ThemeController();
  ThemeData? _themeMode = AnaTheme;
  ThemeData? get themeMode => _themeMode;

  bool get isAnaTheme => _themeMode == AnaTheme;

  switchTheme() {
    _themeMode = themeMode == AnaTheme ? ErpTheme : AnaTheme;
    notifyListeners();
  }
}
