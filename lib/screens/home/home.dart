import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app04/services/auth.dart';
import 'package:app04/services/database.dart';
import 'package:provider/provider.dart';
import 'package:app04/screens/home/app04_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().app04,
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
            )
          ],
        ),
body: App04List()

      ),
    );
  }
}
