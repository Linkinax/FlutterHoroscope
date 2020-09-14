import 'package:flutter/material.dart';

import 'package:oroscopo/Model/Sign.dart';
import 'package:oroscopo/Controller/SignDataManager.dart';

class MyHoroscopeViewer extends StatelessWidget {
  String segno;
  Sign sign;

  MyHoroscopeViewer(String segno) {
    this.segno = segno;
    fetchData();
  }

  Future<void> fetchData() async {
    this.segno = segno.toLowerCase();
    SignDataManager dataManager = new SignDataManager();
    await dataManager.getSignData(this.segno);
    this.sign = dataManager.getData();
    print(sign.amore);
  }

  @override
  Widget build(BuildContext context) {
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
            Text(this.sign.amore ?? 'Loading...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white)),
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
            Text(this.sign.lavoro ?? ' Loading...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white)),
          ]))
    ]);
  }
}
