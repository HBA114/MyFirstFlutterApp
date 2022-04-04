import 'package:flutter/material.dart';
import 'package:kurulum_demo/ui/theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  ThemePreferences _pref = ThemePreferences();
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _pref = ThemePreferences();
    getPreferences();
  }

  getPreferences() async {
    _isDark = await _pref.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _pref.setTheme(value);
    notifyListeners();
  }
}
