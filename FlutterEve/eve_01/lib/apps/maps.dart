import 'package:eve_01/apps/defaultApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Maps extends DefaultApp {
  TextEditingController originStreet = TextEditingController();
  TextEditingController originCity = TextEditingController();
  TextEditingController originCountry = TextEditingController();
  TextEditingController destinationStreet = TextEditingController();
  TextEditingController destinationCity = TextEditingController();
  TextEditingController destinationCountry = TextEditingController();

  Maps() {
    name = "Maps";
    pathToIcon = "assets/icons/googlemaps.png";
  }
  Widget getBuild(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Maps"),
          backgroundColor: new Color(0xFF000000),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon : Icon(Icons.directions_car)),
              Tab(icon : Icon (Icons.directions_bus))
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: TabBarView(children: [
            getDirectionsWidget(),
            getDirectionsWidget(),
          ])
      )));
  }

  void parseInput(String method) {
    String output = "eve directions " + method + " ";
    output +=
        originStreet.text + "," + originCity.text + "," + originCountry.text;
    output += "*";
    output += destinationStreet.text +
        "," +
        destinationCity.text +
        "," +
        destinationCountry.text;
    sendSMS(output);
  }
  Widget getDirectionsWidget() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Center(
          child: Text(
            "Origin",
            style: new TextStyle(fontSize: 30.0),
          ),
        ),
        Container(
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(hintText: "House No. and Street"),
            controller: originStreet,
          ),
        ),
        Container(
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(hintText: "City"),
            controller: originCity,
          ),
        ),
        Container(
          height: 80.0,
          child: TextField(
            decoration: InputDecoration(hintText: "Country"),
            controller: originCountry,
          ),
        ),
        Center(
          child: Text(
            "Destination",
            style: new TextStyle(fontSize: 30.0),
          ),
        ),
        Container(
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(hintText: "House No. and Street"),
            controller: destinationStreet,
          ),
        ),
        Container(
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(hintText: "City"),
            controller: destinationCity,
          ),
        ),
        Container(
          height: 80.0,
          child: TextField(
            decoration: InputDecoration(hintText: "Country"),
            controller: destinationCountry,
          ),
        ),
        Container(
            height: 80.0,
            margin: EdgeInsets.only(left: 60.0, right: 60.0),
            child: RaisedButton(
                child: Text(
                  "Submit",
                  style: new TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () {
                  parseInput("drive");
                }))
      ],
    );
  }
}
