import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oroscopo/View/MyHoroscopeViewr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IlMioOroscopo.it',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'IlMioOroscopo.it'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: BackgroundImage(),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundImage extends StatefulWidget {
  String dropDownValue = "Pick";

  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  String dropDownValue = "Nessuno";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Center(
          child: new Image.asset(
            'assets/constellation_app.png',
            width: size.width,
            height: size.height - 80,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Seleziona il tuo segno zodiacale",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white)),
            Center(
              child: Theme(
                data: ThemeData.light(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(28.0)),
                    color: Colors.white.withOpacity(0.9),
                  ),
                  child: DropdownButton(
                    value: null,
                    hint: Text(
                      "\t" + dropDownValue,
                      textAlign: TextAlign.center,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropDownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Ariete',
                      'Toro',
                      'Gemelli',
                      'Cancro',
                      'Leone',
                      'Vergine',
                      'Bilancia',
                      'Sagittario',
                      'Scorpione',
                      'Capricorno',
                      'Acquario',
                      'Pesci',
                      'Capricorno'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                value,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              height: 45,
                              child:
                                  Image.asset("assets/signs/" + value + ".jpg"),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Text("Segno selezionato: " + dropDownValue,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white)),
            MyHoroscopeViewer(dropDownValue),
          ],
        ),
      ],
    );
  }
}
