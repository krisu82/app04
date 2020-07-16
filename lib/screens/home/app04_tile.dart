import 'package:flutter/material.dart';
import 'package:app04/models/app04.dart';

class App04Tile extends StatelessWidget {
  final App04 app04;
  App04Tile({this.app04});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
                leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.orange[app04.strength],
              //backgroundImage: AssetImage('assets/coffee_bg.png'),
              //backgroundImage: AssetImage('asstes/coffee_icon.png'),
              ),
              title: Text(app04.name),
              subtitle: Text ('Takes ${app04.sugars} sugar(s)'),
            ),
            )
            );
            
  }
}
