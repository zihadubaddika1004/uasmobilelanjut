import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectmobilelanjut/main.dart';
import 'package:projectmobilelanjut/login.dart';


class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

bool _secureText = true;

class _DaftarState extends State<Daftar> {
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  String nama, username, email, password;
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
    final response = await http.post("http://redigo-api.000webhostapp.com/register.php", body: {
      "nama": nama,
      "username": username,
      "email": email,
      "password": password
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
        title: Text("Register"),
      ),
      body: Form(
        key: _key,
        autovalidate: validate,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              width: 200.0,
              height: 100.0,
            ),
            TextFormField(
              onSaved: (e) => nama = e,
              decoration: InputDecoration(
                labelText: "Nama",
                labelStyle: new TextStyle(
                  color: Colors.black,
                ),
              ),
              cursorColor: Color(0xffFF4747),
            ),
            TextFormField(
              onSaved: (e) => username = e,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: new TextStyle(
                  color: Colors.black,
                ),
              ),
              cursorColor: Color(0xffFF4747),
            ),
            TextFormField(
              onSaved: (e) => email = e,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: new TextStyle(
                  color: Colors.black,
                ),
              ),
              cursorColor: Color(0xffFF4747),
            ),
            TextFormField(
              obscureText: _secureText,
              onSaved: (e) => password = e,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: new TextStyle(
                        color: Colors.black
                    ),
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                    )),
                cursorColor: Color(0xffFF4747)
            ),

            new Padding(padding: EdgeInsets.only(top: 8.0)),
            SizedBox(
              width: 10, // specific value
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
                child: Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}