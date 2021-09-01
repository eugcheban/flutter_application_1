import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyDrawer.dart';

class MyPhoto extends StatelessWidget {
  const MyPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyPhoto'),
        ),
        body: Center(),
        drawer: MyDrawer());
  }
}
