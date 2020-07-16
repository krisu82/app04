import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app04/models/app04.dart';
import 'package:app04/screens/home/app04_tile.dart';

class App04List extends StatefulWidget {
  @override
  _App04ListState createState() => _App04ListState();
}

class _App04ListState extends State<App04List> {
  @override
  Widget build(BuildContext context) {
    
    final app04s = Provider.of<List<App04>>(context) ?? [];


    return ListView.builder(
      itemCount: app04s.length,
      itemBuilder: (context, index) {
        return App04Tile(app04: app04s[index]);

      },

    );
  }
}
