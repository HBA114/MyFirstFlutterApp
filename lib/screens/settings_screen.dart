import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  late bool Theme;
  late int countAll;
  SettingsScreen(this.Theme, this.countAll);
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState(Theme, countAll);
  }
}

class _SettingsScreenState extends State {
  late bool Theme;
  late int countAll;
  _SettingsScreenState(this.Theme, this.countAll);
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
          TextButton(
            onPressed: () {
              setState(() {
                setThemePref();
              });
            },
            child: const Text(
              'Change Theme',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple[400])),
          ),
          const Padding(padding: EdgeInsets.all(20.0)),
        ],
      ),
    );
  }

  setThemePref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('darkTheme') == null) {
      sharedPreferences.setBool('darkTheme', true);
    } else if (sharedPreferences.getBool('darkTheme') == true) {
      sharedPreferences.setBool('darkTheme', false);
      setState(() => Theme = false);
    } else {
      sharedPreferences.setBool('darkTheme', true);
      setState(() => Theme = true);
    }
  }
}
