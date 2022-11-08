import 'package:flutter/material.dart';
import 'package:Counter/screens/main_screen.dart';
import 'package:Counter/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => CounterAppState();
}

class CounterAppState extends State<CounterApp> {
  @override
  // ignore: must_call_super
  void initState() {
    getNotifier();
  }

  final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
              notifier.value, // Decides which theme to show, light or dark.
          routes: {
            '/main': ((context) => MainScreen()),
            '/settings': ((context) => SettingsScreen(notifier, countAll)),
          },
          initialRoute: '/main',
        );
      },
    );
  }

  getNotifier() async {
    bool isDarkTheme = await getThemePref();
    if (isDarkTheme) {
      notifier.value = ThemeMode.dark;
    } else {
      notifier.value = ThemeMode.light;
    }
  }

  getThemePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('darkTheme') == null) {
      pref.setBool('darkTheme', true);
    }
    bool isDarkTheme = pref.getBool('darkTheme')!;
    return isDarkTheme;
  }
}
