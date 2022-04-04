import 'package:flutter/material.dart';
import 'package:kurulum_demo/screens/main_screen.dart';
import 'package:kurulum_demo/screens/settings_screen.dart';
import 'package:kurulum_demo/ui/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: ((context) => ThemeProvider()),
        builder: ((context, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            routes: {
              '/main': ((context) => MainScreen()),
              '/settings': ((context) => SettingsScreen(countAll)),
            },
            initialRoute: '/main',
          );
        }),
      );
}
