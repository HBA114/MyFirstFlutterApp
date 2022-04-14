import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

CustomTheme currentTheme = CustomTheme();
// CustomTheme preferredTheme = CustomTheme.withPref();

class CustomTheme with ChangeNotifier {
  bool isDarkTheme = true;

  CustomTheme();
  CustomTheme.withPref(this.isDarkTheme);

  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

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

  ThemeMode get preferredTheme {
    // getThemePref();
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  // setThemePref() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getBool('darkTheme') == null) {
  //     sharedPreferences.setBool('darkTheme', true);
  //     isDarkTheme = true;
  //   } else if (sharedPreferences.getBool('darkTheme') == true) {
  //     sharedPreferences.setBool('darkTheme', false);
  //     isDarkTheme = false;
  //   } else {
  //     sharedPreferences.setBool('darkTheme', true);
  //     isDarkTheme = true;
  //   }
  // }

  // getSharedPref() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }
}
