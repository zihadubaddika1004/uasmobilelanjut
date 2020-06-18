import 'package:flutter/material.dart';
import 'package:projectmobilelanjut/LihatJawaban.dart';
import 'package:projectmobilelanjut/kodeAkunPremium.dart';
import 'package:projectmobilelanjut/login.dart';
import 'package:projectmobilelanjut/tanyaDokterSpesialis.dart';
import 'package:projectmobilelanjut/tanyaDokterUmum.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF4747),
        title: Text("Beranda"),
      ),
      body:new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        child: new Column(
            children: <Widget>[
            new Container(
              margin: EdgeInsets.only(bottom: 8.0),
            ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("UPGRADE AKUN ANDA KE PREMIUM ?",
                      style: new TextStyle(fontSize: 18.0)),
                  new Padding(padding: EdgeInsets.only(right: 8.0)),
                  GestureDetector(
                    onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return kodeAkunPremium();
                    })),
                    child: Image.asset(
                      "images/premium.png",
                      width: 40.0,
                      height: 40.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 300,
                height: 60,// specific value
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return tanyaDokterUmum();
                    }));
                  },
                  textColor: Colors.white,
                  color: Color(0xffFF4747),
                  child: Text("DOKTER UMUM"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: SizedBox(
                  width: 300,
                  height: 60,// specific value
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return kodeAkunPremium();
                      }));
                    },
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: new Text(
                              "DOKTER SPESIALIS",
                            )),
                        new Image.asset(
                          'images/premium_white.png',
                          height: 50.0,
                          width: 50.0,
                        ),
                      ],
                    ),
                    textColor: Colors.white,
                    color: Color(0xffFF4747),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: 300,
                  height: 60,// specific value
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LihatJawabanPage();
                      }));
                      },
                    textColor: Colors.white,
                    color: Color(0xffFF4747),
                    child: Text("LIHAT JAWABAN"),
                  ),
                ),
              ),
         ],
        )
      ),
    );
  }
}