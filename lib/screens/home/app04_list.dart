import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class App04List extends StatefulWidget {
  @override
  _App04ListState createState() => _App04ListState();
}

class _App04ListState extends State<App04List> {
  @override
  Widget build(BuildContext context) {
    
    final app04 = Provider.of<QuerySnapshot>(context);
    //rint(app04.documents);
for (var doc in app04.documents){

  print(doc.data);
}

    return Container(
      
    );
  }
}