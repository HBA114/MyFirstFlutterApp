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
  @override
  // ignore: must_call_super
  void initState() {
    setTheme();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.preferredTheme,
      routes: {
        '/main': ((context) => MainScreen()),
        '/settings': ((context) => SettingsScreen(countAll)),
      },
      initialRoute: '/main',
    );
  }

  setTheme() async {
    var x = await CustomTheme().getThemePref();
    if (!x) {
      currentTheme.toggleTheme();
    }
  }
}
