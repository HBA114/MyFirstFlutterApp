import 'package:flutter/material.dart';
import 'package:kurulum_demo/ui/context_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

int _counter = 0;
int countAll = 0;

class _MainScreenState extends State {
  @override
  void initState() {
    setState(() {
      getCountPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/settings');
              print('Hello');
              goToSettings();
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        Padding(
            padding:
                EdgeInsets.symmetric(vertical: context.dynamicHeight(0.2))),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FloatingActionButton(
                  heroTag: 'ResetButton',
                  onPressed: _resetCounter,
                  child: const Text('Reset'),
                ),
              ),
              Expanded(
                flex: 3,
                child: FloatingActionButton(
                  heroTag: 'AddButton',
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      countIntoPref(_counter);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      // print(countAll);
    });
  }

  countIntoPref(int count) async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getInt('count') == null) {
      pref.setInt('count', 0);
    } else {
      pref.setInt('count', pref.getInt('count')!.toInt() + 1);
    }
    getCountPref();
  }

  getCountPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt('count') == null) {
      setState(() => countAll = 0);
    } else {
      setState(() => countAll = pref.getInt('count')!);
    }
  }

  goToSettings() {
    Navigator.pushNamed(context, '/settings');
  }
}