import 'package:app04/screens/home/settings_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app04/services/auth.dart';
import 'package:app04/services/database.dart';
import 'package:provider/provider.dart';
import 'package:app04/screens/home/app04_list.dart';
import 'package:app04/models/app04.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<App04>>.value(
      value: DatabaseService().app04s,
      child: Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            title: Text('App04'),
            backgroundColor: Colors.orange[900],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('wyloguj'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Ustawienia'),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/coffee_bg.png'),
                      fit: BoxFit.cover,
                      )),
              child: App04List())),
    );
  }
}
