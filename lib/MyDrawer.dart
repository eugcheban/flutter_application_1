import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ListPhotos.dart';
import 'package:flutter_application_1/MyPhoto.dart';
import 'package:flutter_application_1/main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Home'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => MyApp()));
        },
      ),
      ListTile(
        title: const Text('List'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ListPhotos()));
        },
      ),
      ListTile(
        title: const Text('Photo'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => MyPhoto()));
        },
      )
    ]));
  }
}
