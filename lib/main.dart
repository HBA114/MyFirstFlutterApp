import 'package:flutter/material.dart';
import 'package:kurulum_demo/screens/main_screen.dart';
import 'package:kurulum_demo/screens/settings_screen.dart';
import 'package:kurulum_demo/ui/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  late SharedPreferences preferences;
  bool isThemeDark = true;
  @override
  // ignore: must_call_super
  void initState() {
    getThemeSharedPref();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme preferredTheme = CustomTheme.withPref(isThemeDark);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      // themeMode: preferredTheme.preferredTheme,
      routes: {
        '/main': ((context) => MainScreen()),
        '/settings': ((context) => SettingsScreen(countAll)),
      },
      initialRoute: '/main',
    );
  }

  getThemeSharedPref() async {
    preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('darkTheme') == null) {
      preferences.setBool('darkTheme', true);
      isThemeDark = true;
    } else if (preferences.getBool('darkTheme') == true) {
      // preferences.setBool('darkTheme', false);
      print("false");
      isThemeDark = false;
    } else {
      // preferences.setBool('darkTheme', true);
      isThemeDark = true;
    }
    setState(() {});
  }
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/main': ((context) => MainScreen()),
        '/settings': ((context) => SettingsScreen(countAll)),
      },
      initialRoute: '/main',
    );
  }
}
