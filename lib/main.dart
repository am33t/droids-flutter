import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

final ThemeData _themeData = new ThemeData(primaryColor: new Color(0xff222222));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My App',
      theme: _themeData,
      home: new DroidsPage(),
    );
  }
}

class DroidsPage extends StatefulWidget {
  @override
  _DroidsPageState createState() => new _DroidsPageState();
}

class _DroidsPageState extends State<DroidsPage> {
  int _counter = 0;
  var _droidsImageNames = [
    "assets/1-R2-D2.png",
    "assets/2-C-3PO.jpg",
    "assets/3-BB-8.png",
    "assets/4-ProbeDroid.jpg",
    "assets/5-Droideka.jpg",
    "assets/6-Battle Droid.png",
    "assets/7-Huyang.png"
  ];
  var _droidsNames = [
    'R2-D2',
    'C-3PO',
    'BB-8',
    'ProbeDroid',
    'Droideka',
    'Battle Droid',
    'Huyang'
  ];
  String _displayedName = 'Star Wars';
  String _displayedImageName = "assets/StarWars.png";

  void _tappedListItem(int index) {
    Navigator.of(context)..pop();
    this.setState(() {
      _displayedName = _droidsNames[index];
      _displayedImageName = _droidsImageNames[index];
      _counter = index;
      if (_counter + 1 >= _droidsNames.length) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  void _onNextPressed() {
    this.setState(() {
      _displayedName = _droidsNames[_counter];
      _displayedImageName = _droidsImageNames[_counter];
      if (_counter + 1 >= _droidsNames.length) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _drawerItems = [];
    for (int i = 0; i < _droidsNames.length; i++) {
      var item = new ListTile(
          title: new Text(_droidsNames[i]),
          onTap: () {
            _tappedListItem(i);
          });
      _drawerItems.add(item);
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Droids')),
      drawer: new Drawer(
        child: new ListView(children: _drawerItems),
      ),
      body: new Center(
          child: new ListView(
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: new Text(_displayedName)),
          new Padding(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: new Image(image: new AssetImage(_displayedImageName))),
          new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new RaisedButton(
                onPressed: _onNextPressed,
                child: new Text('Next'),
              ))
        ],
      )),
    );
  }
}
