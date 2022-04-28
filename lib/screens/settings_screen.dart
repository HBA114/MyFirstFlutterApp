import 'package:flutter/material.dart';
import 'package:kurulum_demo/ui/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  late int countAll;
  SettingsScreen(this.countAll);
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState(countAll);
  }
}

class _SettingsScreenState extends State {
  late int countAll;
  _SettingsScreenState(this.countAll);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: buildSettingsBody(),
    );
  }

  buildSettingsBody() {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10.0)),
          const Text(
            'Total Count',
            style: TextStyle(fontSize: 24),
          ),
          const Padding(padding: EdgeInsets.all(20.0)),
          Text(
            countAll.toString(),
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const Expanded(
            child: Text(''),
          ), // Space between Total count and settings buttons
          // TextButton(
          //   onPressed: () {
          //     setState(() {});
          //   },
          //   child: const Text('Change Theme'),
          // ),
          ThemeButton(),
          const Padding(padding: EdgeInsets.all(20.0)),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ThemeButton() {
    return IconButton(
        onPressed: () {
          currentTheme.toggleTheme();
          setThemePref();
        },
        icon: currentTheme.isDarkTheme
            ? const Icon(Icons.sunny)
            : const Icon(Icons.mode_night));
  }

  setThemePref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('darkTheme') == null) {
      print("null");
      sharedPreferences.setBool('darkTheme', true);
      print('darkTheme = ' + sharedPreferences.getBool('darkTheme').toString());
    } else if (sharedPreferences.getBool('darkTheme') == true) {
      sharedPreferences.setBool('darkTheme', false);
      print('darkTheme = ' + sharedPreferences.getBool('darkTheme').toString());
    } else {
      sharedPreferences.setBool('darkTheme', true);
      print('darkTheme = ' + sharedPreferences.getBool('darkTheme').toString());
    }
  }
}
