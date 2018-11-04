import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
abstract class DefaultApp{
  static const platform = const MethodChannel('eve.messenger/sms');
  String name = "App";
  String pathToIcon = "assets/icons/eve.png";
  DefaultApp(){

  }
  Widget getBuild(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sigma"),
      ),
    );
  }
  Future<Null> sendSMS(String text) async{
    try{
      await platform.invokeMethod('sendSMS',{"text":text});
    } on PlatformException catch(e){

    }
  }
}