import 'package:flutter/material.dart';
import './samples/newRoute.dart';
import './samples/echoRoute.dart';
import './samples/countRoute.dart';
import './samples/assetRoute.dart';
import './samples/tapboxARoute.dart';
import './components/RandomWordsWidget/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
        "new_page_with_params": (context) => EchoRoute(),
        "new_page_count": (context) => CountRoute(title: 'Count Page'),
        "asset_page": (context) => AssetRoute(),
        "tapboxA_page": (context) => TapboxARoute(),
      },
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MainPage extends StatelessWidget {
  final String title;
  MainPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("open count route"),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, 'new_page_count');
              },
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                // 导航到新路由
                // Navigator.push(context, new MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              child: Text("open new route with params"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed("new_page_with_params", arguments: "root page param");
              },
            ),
            FlatButton(
              child: Text("go asset page"),
              textColor: Colors.black26,
              onPressed: () {
                Navigator.pushNamed(context, 'asset_page');
              },
            ),
            FlatButton(
              child: Text("go tapboxA page"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, 'tapboxA_page');
              },
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
    );
  }
}


