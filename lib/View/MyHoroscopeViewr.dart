import 'package:flutter/material.dart';

import 'package:oroscopo/Model/Sign.dart';
import 'package:oroscopo/Controller/SignDataManager.dart';
import 'package:oroscopo/main.dart';

class MyHoroscopeViewer extends StatelessWidget {
  String segno;
  Sign sign;
  bool f = false;
  BuildContext bc;

  MyHoroscopeViewer(String segno) {
    this.segno = segno;
    fetchData();
  }

  Future<void> fetchData() async {
    print("Starting to fetch...\n");
    this.segno = segno.toLowerCase();
    SignDataManager dataManager = new SignDataManager();
    await dataManager.getSignData(this.segno);
    this.sign = dataManager.getData();
    print(sign.amore);
    if (!f) {
      build(bc);
      f = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    bc = context;
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Amore",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.pink[200])),
            FutureBuilder(
              future: fetchData(),
              builder: (BuildContext cont, AsyncSnapshot snap) {
                if (snap.connectionState == ConnectionState.done) {
                  var a = sign.amore;
                  print("\n\n $a \n\nHere we have the future builder\n\n");
                  return new Text(a,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white));
                } else {
                  return new Text("Loading...");
                }
              },
            ),
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Text("Lavoro",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.pink[200])),
            FutureBuilder(
              future: fetchData(),
              builder: (BuildContext cont, AsyncSnapshot snap) {
                if (snap.connectionState == ConnectionState.done) {
                  var work = sign.lavoro;
                  print("\n\n $work \n\nHere we have the future builder\n\n");
                  return new Text(work,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white));
                } else {
                  return new Text("Loading...");
                }
              },
            ),
          ]))
    ]);
  }
}
