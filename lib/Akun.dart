import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => new _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF4747),
        title: Text("Akun"),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
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
                "images/iconakun.png",
                width: 75.0,
                height: 75.0,
              ),
              new Container(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Nama",
                        ),
                        initialValue: "Lofanny Wahyu Dandi",
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        initialValue: "lofannywahyu@gmail.com",
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Tipe User",
                        ),
                        initialValue: "Pasien",
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Edit Profile', icon: Icons.directions_boat),
  const Choice(title: 'Logout', icon: Icons.directions_bus , ),
];