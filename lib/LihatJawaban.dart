import 'package:flutter/material.dart';

class LihatJawabanPage extends StatefulWidget {
  @override
  _LihatJawabanPageState createState() => new _LihatJawabanPageState();
}

class _LihatJawabanPageState extends State<LihatJawabanPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFF4747),
          title: Text("Rekam Medis"),
        ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(10, 5, 20, 0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text("Jawaban",style: new TextStyle(fontSize: 23.0)),
          Text("Pertanyaan Anda di Sini ! ",style: new TextStyle(fontSize: 18.0)),
          Container(
            width: 400.00,
            height: 600.00,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: new Card(
              child: new Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text("Jawaban Dokter",style: new TextStyle(fontSize: 23.0)),
                  ),

                ],
              ),
            ),
          )
          ],
      ),
      )
    );
  }
}