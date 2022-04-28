import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  bool isDarkTheme = true;

  CustomTheme();

  // Yüklerken son kaydedilen tema ile başlat ve tema değişince kaydet.

  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  ThemeMode get preferredTheme {
    // getThemePref();
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData.light();
  }

  static ThemeData get darkTheme {
    return ThemeData.dark();
  }

  Future<SharedPreferences> getSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  getThemePref() async {
    SharedPreferences pref = await getSharedPreferences();
    if (pref.getBool('darkTheme') == null) {
      pref.setBool('darkTheme', true);
    }
    bool isDarkTheme = pref.getBool('darkTheme')!;
    return isDarkTheme;
  }
}
