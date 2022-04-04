import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const Pref_Key = 'pref_key';

  setTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(Pref_Key, value);
  }

  getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(Pref_Key);
  }
}
