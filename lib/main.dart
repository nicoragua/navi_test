import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      bottomNavBar: PlatformNavBar(
        currentIndex: _index,
        itemChanged: (index) => {_changeIndex(index)},
        items: [
          _getItem(Icons.looks_one, "eins"),
          _getItem(Icons.looks_two, "zwei"),
          _getItem(Icons.looks_3, "drei"),
        ],
      ),
      body: _getRoute(_index),
    );
  }

  Widget _getRoute(int index) {
    switch (index) {
      case 0:
        return First();
      case 1:
        return Second();
      case 2:
        return Third();
    }
    return Container();
  }

  void _changeIndex(int index) {
      setState(() {
        _index = index;
      });
  }

  BottomNavigationBarItem _getItem(IconData icon, String text) {
      return BottomNavigationBarItem(icon: Icon(icon, size: 22), title: Text(text, style: TextStyle(fontSize: 12.0)));
  }

}


class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("1");
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("2");
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("3");
  }
}