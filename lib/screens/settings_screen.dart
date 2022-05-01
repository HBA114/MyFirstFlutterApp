import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  late int countAll;
  late final ValueNotifier<ThemeMode> notifier;
  SettingsScreen(this.notifier, this.countAll, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _SettingsScreenState(notifier, countAll);
  }
}

class _SettingsScreenState extends State {
  late int countAll;
  late final ValueNotifier<ThemeMode> notifier;
  _SettingsScreenState(this.notifier, this.countAll);
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
          setState(() {
            notifier.value = notifier.value == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          });
          setThemePref();
        },
        icon: notifier.value == ThemeMode.dark
            ? const Icon(Icons.sunny)
            : const Icon(Icons.mode_night));
  }

  setThemePref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('darkTheme') == null) {
      sharedPreferences.setBool('darkTheme', true);
    } else if (sharedPreferences.getBool('darkTheme') == true) {
      sharedPreferences.setBool('darkTheme', false);
    } else {
      sharedPreferences.setBool('darkTheme', true);
    }
  }
}
