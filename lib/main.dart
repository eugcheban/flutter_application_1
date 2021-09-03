import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FetchPhotos.dart';
import 'package:flutter_application_1/MyDrawer.dart';
import 'package:flutter_application_1/PhotosList.dart';
import 'package:flutter_application_1/MyPhoto.dart';

void main() {
  runApp(MyApp());
  fetchPhotos();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page '));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(100),
            child: FlatButton(
              child: Text(
                'List of Photos',
                style: TextStyle(fontSize: 10.0),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PhotosList()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(100),
            child: FlatButton(
              child: Text(
                'Fullsize Photo',
                style: TextStyle(fontSize: 10.0),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyPhoto()));
              },
            ),
          ),
        ])),
        drawer: MyDrawer());
  }
}
