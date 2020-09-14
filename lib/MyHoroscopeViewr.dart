import 'package:flutter/material.dart';

class MyHoroscopeViewer extends StatelessWidget {
  final String segno;

  const MyHoroscopeViewer(this.segno);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
            Text(
                "Se siete in coppia, Marte, nel segno tecnicamente benevolo dell’Ariete, vi rende passionali e calorosamente affettuosi col partner. Vi mostrate concilianti e non esagerate in richieste eccessive. Nel caso abbiate “sgarrato” il pianeta vi fa in ogni caso perdonare donandovi un consistente apporto di generosità del partner. ",
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
            Text(
                "Non date peso a giudizi e opinioni che sentirete in ufficio in questa giornata. Urano ostile può indispettirvi, ma voi, con l'appoggio di una bella Venere, terrete una linea di autocontrollo invidiabile. La situazione in generale è stimolante per il vostro spirito competitivo in un contesto che si è venuto a creare tra i vostri colleghi. Sarà sempre Venere a darvi la possibilità di vincere prendendovi il tempo che ci vuole.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white)),
          ]))
    ]);
  }
}
