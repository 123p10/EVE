import 'package:eve_01/apps/defaultApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wikipedia extends DefaultApp{
  Wikipedia(){
    name = "Wikipedia";
    pathToIcon = "assets/icons/wikipedia.jpg";
  }
  Widget getBuild(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Wikipedia"),
        backgroundColor: new Color(0xFF000000),

      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Input Your Search Query",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 30.0
                  ),

                )

              ],
            ),
            Row(

              children: <Widget>[
                Flexible(
                  child: TextField(

                    decoration: InputDecoration(
                        hintText: 'Please enter a search term'
                    )
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 60.0
                    ),
                  )
                )
              ],
            )
          ],
        )
      )
    );
  }
}