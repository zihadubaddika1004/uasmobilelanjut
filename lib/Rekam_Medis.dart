import 'package:flutter/material.dart';
import 'package:projectmobilelanjut/LihatJawaban.dart';
import 'package:projectmobilelanjut/lihatRekamMedis.dart';

class RekamMedisPage extends StatefulWidget {
  @override
  _RekamMedisPageState createState() => new _RekamMedisPageState();
}

class _RekamMedisPageState extends State<RekamMedisPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF4747),
        title: Text("Rekam Medis"),
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
              Text("LIHAT REKAM MEDIS",
              style: new TextStyle(fontSize: 18.0)),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SizedBox(
                  width: 75,
                  height: 40,// specific value
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return lihatRekamMedis();
                      }));
                    },
                    textColor: Colors.white,
                    color: Color(0xffFF4747),
                    child: Text("GO"),
                  ),
                ),
              )
          ],
        ),
      )
    );
  }
}