import 'package:app04/models/user.dart';
import 'package:app04/screens/authenticate/authenticate.dart';
import 'package:app04/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app04/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);
    //zwrotka home lub aunteticate widget
    return Authenticate();
  }
}