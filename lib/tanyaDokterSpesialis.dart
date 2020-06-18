import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tanyaDokterSpesialis extends StatefulWidget {
  @override
  _tanyaDokterSpesialisPageState createState() => new _tanyaDokterSpesialisPageState();
}

class _tanyaDokterSpesialisPageState extends State<tanyaDokterSpesialis> {
  String pertanyaan, lama_gejala, spesialis;
  var validate = false;
  final _key = new GlobalKey<FormState>();

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    }
    else {
      setState(() {
        validate = true;
      });
    }
  }

  submit() async {
    final response = await http.post("http://redigo-api.000webhostapp.com/tanya_spesialis.php", body: {
      "pertanyaan": pertanyaan,
      "lama_gejala": lama_gejala,
      "spesialis": spesialis
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      print(message);
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF4747),
        title: Text("Dokter Spesialis"),
      ),
      body: Form(
        key: _key,
        autovalidate: validate,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              onSaved: (e) => pertanyaan = e,
              decoration: InputDecoration(
                labelText: "Pertanyaan",
                labelStyle: new TextStyle(
                  color: Colors.black,
                ),
              ),
              cursorColor: Color(0xffFF4747),
            ),
            TextFormField(
              onSaved: (e) => lama_gejala = e,
              decoration: InputDecoration(
                labelText: "Berapa Lama Gejala ?",
                labelStyle: new TextStyle(
                  color: Colors.black,
                ),
              ),
              cursorColor: Color(0xffFF4747),
            ),
            TextFormField(
              onSaved: (e) => spesialis = e,
              decoration: InputDecoration(
                labelText: "Spesialis",
                labelStyle: new TextStyle(
                  color: Colors.black,
                ),
              ),
              cursorColor: Color(0xffFF4747),
            ),
            new Padding(padding: EdgeInsets.only(top: 8.0)),
            Padding(
              padding: const EdgeInsets.fromLTRB(255, 10, 0 ,0),
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
                        check();
                      },
                      textColor: Colors.white,
                      color: Color(0xffFF4747),
                      child: Text("Kirim"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}