import 'package:flutter/material.dart';
import 'package:kurulum_demo/screens/main_screen.dart';
import 'package:kurulum_demo/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

bool Theme = true;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  @override
  void initState() {
    setState(() {
      getThemePref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme',
      theme: Theme ? ThemeData.dark() : ThemeData.light(),
      routes: {
        '/main': ((context) => MainScreen()),
        '/settings': (((context) => SettingsScreen(Theme, countAll))),
      },
      initialRoute: '/main',
    );
  }

  getThemePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('darkTheme') == null) {
      pref.setBool('darkTheme', true);
      setState(() => Theme = true);
    } else if (pref.getBool('darkTheme') == true) {
      setState(() => Theme = true);
    } else {
      setState(() => Theme = false);
    }
  }
}


// class MyApp extends StatelessWidget {
//   // const MyApp({Key? key}) : super(key: key);

//   // @override
//   // Widget build(BuildContext context) {
//   //   return ChangeNotifier();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       routes: {
//         '/main': ((context) => MainScreen()),
//         '/settings': ((context) => SettingsScreen(countAll)),
//       },
//       initialRoute: '/main',
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// int countAll = 0;

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   @override
//   void initState() {
//     setState(() {
//       getCountPref();
//     });
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//       countIntoPref(_counter);
//     });
//   }

//   void _resetCounter() {
//     setState(() {
//       _counter = 0;
//       // print(countAll);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => SettingsScreen(countAll)));
//               },
//               icon: const Icon(Icons.settings)),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Text(
//                 '$_counter',
//                 style: Theme.of(context).textTheme.headline2,
//               ),
//             ),
//           ),
//           Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: context.dynamicHeight(0.2))),
//           Expanded(
//             flex: 2,
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   flex: 3,
//                   child: FloatingActionButton(
//                     onPressed: _resetCounter,
//                     child: const Text('Reset'),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: FloatingActionButton(
//                     onPressed: _incrementCounter,
//                     child: const Icon(Icons.add),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   getSharedPref() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref;
//   }

//   countIntoPref(int count) async {
//     var pref = await SharedPreferences.getInstance();
//     if (pref.getInt('count') == null) {
//       pref.setInt('count', 0);
//     } else {
//       pref.setInt('count', pref.getInt('count')!.toInt() + 1);
//     }
//     getCountPref();
//   }

//   getCountPref() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     if (pref.getInt('count') == null) {
//       setState(() => countAll = 0);
//     } else {
//       setState(() => countAll = pref.getInt('count')!);
//     }
//   }
// }





//return Scaffold(
//   appBar: AppBar(
//     // Here we take the value from the MyHomePage object that was created by
//     // the App.build method, and use it to set our appbar title.
//     title: Text(widget.title),
//     centerTitle: true,
//   ),
//   body: Center(
//     // Center is a layout widget. It takes a single child and positions it
//     // in the middle of the parent.
//     child: Column(
//       // Column is also a layout widget. It takes a list of children and
//       // arranges them vertically. By default, it sizes itself to fit its
//       // children horizontally, and tries to be as tall as its parent.
//       //
//       // Invoke "debug painting" (press "p" in the console, choose the
//       // "Toggle Debug Paint" action from the Flutter Inspector in Android
//       // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//       // to see the wireframe for each widget.
//       //
//       // Column has various properties to control how it sizes itself and
//       // how it positions its children. Here we use mainAxisAlignment to
//       // center the children vertically; the main axis here is the vertical
//       // axis because Columns are vertical (the cross axis would be
//       // horizontal).
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const Text(
//           'Butona Basma Sayısı',
//           textScaleFactor: 1.5,
//           textAlign: TextAlign.end,
//         ),
//         Text(
//           '$_counter',
//           style: Theme.of(context).textTheme.headline4,
//           textScaleFactor: 1.8,
//         ),
//         FloatingActionButton(
//           onPressed: _resetCounter,
//           child: const Text('Reset'),
//         ),
//         TextButton(
//           style: TextButton.styleFrom(
//             primary: Colors.blue,
//           ),
//           onPressed: _resetCounter,
//           child: const Text('Reset1'),
//         ),
//         new Container(
//           padding: new EdgeInsets.only(top: 16.0),
//           child: Text('Hello'),
//         ),
//       ],
//     ),
//   ),
//   floatingActionButton: FloatingActionButton(
//     onPressed: _incrementCounter,
//     tooltip: 'Increment',
//     child: const Icon(Icons.add),
//   ),
//   floatingActionButtonLocation: FloatingActionButtonLocation
//       .endFloat, // This trailing comma makes auto-formatting nicer for build methods.
// );



// body: Card(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Container(
//               padding:
//                   EdgeInsets.symmetric(vertical: context.dynamicHeight(0.1)),  // ! Use of this cause Errors in screen size.
//               color: Colors.transparent,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     '$_counter',
//                     style: const TextStyle(fontSize: 70, fontFamily: 'Roboto'),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.symmetric(vertical: context.dynamicHeight(0.3)),
//               color: Colors.transparent,
//               child: Row(
//                 children: <Widget>[
//                   FloatingActionButton(
//                     onPressed: _resetCounter,
//                     child: const Text('Reset'),
//                   ),
//                   FloatingActionButton(
//                     onPressed: _incrementCounter,
//                     child: const Icon(Icons.add),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),