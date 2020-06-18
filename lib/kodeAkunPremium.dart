import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectmobilelanjut/BerandaPremium.dart';

class kodeAkunPremium extends StatefulWidget {
  @override
  _kodeAkunPremiumPageState createState() => new _kodeAkunPremiumPageState();
}

class _kodeAkunPremiumPageState extends State<kodeAkunPremium> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF4747),
        title: Text("Upgrade Akun"),
      ),
      body: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/premium.png",
                width: 100.0,
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Masukkan Kode Unik",
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
                padding: const EdgeInsets.fromLTRB(10, 10, 0 ,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 75,
                      height: 40,// specific value
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return BerandaPremiumPage();
                          }));
                        },
                        textColor: Colors.white,
                        color: Color(0xffFF4747),
                        child: Text("GO"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}