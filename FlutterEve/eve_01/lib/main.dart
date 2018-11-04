import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eve_01/apps/defaultApp.dart';
import 'package:eve_01/apps/wikipedia.dart';
import 'package:eve_01/apps/maps.dart';
import 'package:eve_01/apps/eve.dart';
import 'package:eve_01/send.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static var appList = List();
  MyApp(){
    appList.add(new Wikipedia());
    appList.add(new Eve());
    appList.add(new Maps());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new MaterialApp(
      title: 'Eve',

      home: new MyHomePage(title: 'Eve'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return new Material(
      child: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/backgrounds/iphonespace.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new CustomScrollView(
          primary: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(15.0),
              sliver: new SliverGrid.count(
                crossAxisSpacing: 0.0,
                crossAxisCount: 4,
                children: _loadApps()
              )
            )
                ],
              ),
            ),
    );
  }
  List<Widget> _loadApps(){
    List<Widget> appsAndIcons = List<Widget>();
    for(DefaultApp app in MyApp.appList){
      appsAndIcons.add(_appLogo(app));
    }
    return appsAndIcons;
  }
  Widget _appLogo(DefaultApp app) {
    String _url = app.pathToIcon;
    String name = app.name;
    return new Column(
        children: <Widget>[
          new Container(
              height: 70.0,
              width: 70.0,
              padding: new EdgeInsets.all(10.0),
              child: new Container(
                  child: new FlatButton(
                      //Bruv this makes no sense just leave it
                      padding: new EdgeInsets.all(0.0),
                      onPressed: (){
                        _changeApp(app);
                      },
                      child: new ClipRRect(
                          borderRadius: new BorderRadius.circular(16.0),
                          child: new Image.asset(
                            _url,
                            fit: BoxFit.contain,
                          )
                      )
                  )
              )
          ),
          _textUnderApp(name)
      ]
    );
  }
  Widget _textUnderApp(String appName){
    return new Text(
        appName,
        style: new TextStyle(
            fontSize: 10.0,
            color: Colors.white
        )
    );

  }
  void _changeApp(DefaultApp thisApp){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MySendScreen(app: thisApp )),
    );
  }
}
