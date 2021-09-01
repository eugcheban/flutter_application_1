import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyDrawer.dart';

class ListPhotos extends StatelessWidget {
  const ListPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Center(),
        drawer: MyDrawer());
  }
}
