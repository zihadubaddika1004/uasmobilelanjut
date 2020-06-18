import 'package:flutter/material.dart';

class lihatRekamMedis extends StatefulWidget {
  @override
  _lihatRekamMedisState createState() => new _lihatRekamMedisState();
}

class _lihatRekamMedisState extends State<lihatRekamMedis>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFF4747),
          title: Text("Lihat Rekam Medis"),
        ),
        body: new Container(
          padding: EdgeInsets.all(10.00),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Rekam Medis Pribadi",style: new TextStyle(fontSize: 30.0)),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Masukkan Kode Rekam Medis",
                    labelStyle: new TextStyle(
                        color: Colors.black
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(250, 10, 0 ,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 40,// specific value
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        onPressed: () {
                        },
                        textColor: Colors.white,
                        color: Color(0xffFF4747),
                        child: Text("Kirim"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 400.00,
                height: 450.00,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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