import 'package:flutter/material.dart';
import 'package:eve_01/main.dart';
import 'package:eve_01/apps/defaultApp.dart';

class MySendScreen extends StatelessWidget{
  DefaultApp app;
  MySendScreen({Key key, @required this.app}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return app.getBuild(context);
  }
}