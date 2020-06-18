import 'package:flutter/material.dart';
import 'package:projectmobilelanjut/LihatJawaban.dart';
import 'package:projectmobilelanjut/kodeAkunPremium.dart';
import 'package:projectmobilelanjut/login.dart';
import 'package:projectmobilelanjut/tanyaDokterSpesialis.dart';
import 'package:projectmobilelanjut/tanyaDokterUmum.dart';

class BerandaPremiumPage extends StatefulWidget {
  @override
  _BerandaPremiumPageState createState() => new _BerandaPremiumPageState();
}

class _BerandaPremiumPageState extends State<BerandaPremiumPage> {

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
                        return tanyaDokterSpesialis();
                      }));
                    },
                    textColor: Colors.white,
                    color: Color(0xffFF4747),
                    child: Text("DOKTER SPESIALIS"),
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