import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectmobilelanjut/register.dart';
import 'package:projectmobilelanjut/Beranda.dart';
import 'package:projectmobilelanjut/Rekam_Medis.dart';
import 'package:projectmobilelanjut/Akun.dart';

void main(){
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(),

  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
enum LoginStatus {notSignIn, signIn}
LoginStatus _loginStatus = LoginStatus.notSignIn;
String username, password;
final _key = new GlobalKey<FormState>();
bool _secureText = true;

class _LoginState extends State<Login> {
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http
        .post(
        "https://redigo-api.000webhostapp.com/login.php",
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    String user = data['username'];
    String pass = data['password'];
    String id = data['id'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, user, pass, id);
      });
      print(message);
    } else {
      print(message);
    }
  }

  savePref(int value, String username, String nama, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("password", password);
      preferences.setString("username", username);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffFF4747),
            title: Text("Login"),
          ),
          body: Form(
            key: _key,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                Image.asset(
                  "images/logo.png",
                  width: 200.0,
                  height: 100.0,
                ),
                TextFormField(
                  initialValue: "lofanny",
                  validator: (e) {
                    if (e.isEmpty) {
                      return "Isi username terlebih dahulu";
                    }
                  },
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
                  initialValue: "lampung123",
                    validator: (e) {
                      if (e.isEmpty) {
                        return "Isi password terlebih dahulu";
                      }
                    },
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
                      child: Text("Masuk"),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Belum Memiliki Akun ?",
                        style: new TextStyle(fontSize: 20.0)),
                    new Padding(padding: EdgeInsets.only(right: 8.0)),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Daftar()
                        )
                        );
                      },
                      child: new Text("DAFTAR" , style: new TextStyle(fontSize: 18.0 , color: Color(0xffFF4747))),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return Dashboard(signOut);
        break;
    }
  }
}

class Dashboard extends StatefulWidget {
  final VoidCallback signOut;
  Dashboard(this.signOut);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  signOut(){
    setState(() {
      widget.signOut();
    });
  }
  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {});
  }
  @override
  void initState(){
    super.initState();
    getPref();
  }
  int _currentindex = 1;
  List<Widget> _container = [
    RekamMedisPage(),
    BerandaPage(),
    AkunPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _container[_currentindex],
        bottomNavigationBar: _buildBottomNavigation()
    );
  }

  Widget _buildBottomNavigation(){
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentindex = index;
        });
      },
      currentIndex: _currentindex,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.list,
            color: Color(0xffFF4747),
            size: 30.0,
          ),
          icon: Icon(
            Icons.list,
            color: Colors.grey,
            size: 30.0,
          ),
          title: new Text('Rekam Medis')
        ),
        BottomNavigationBarItem(
          activeIcon: new ImageIcon(
            AssetImage("images/home.png"),
            color: Color(0xffFF4747)
          ),
          icon: new ImageIcon(
            AssetImage("images/home.png")
          ),
          title: new Text('Beranda'),
        ),
        BottomNavigationBarItem(
          activeIcon: new ImageIcon(
            AssetImage("images/icon.png"),
            color: Color(0xffFF4747)
          ),
          icon: new ImageIcon(
            AssetImage("images/icon.png")
          ),
          title: new Text('Akun'),
        ),
      ],
    );
  }
}
