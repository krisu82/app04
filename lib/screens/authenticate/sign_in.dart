import 'package:app04/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;
  SignIn ({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

// textowe pole stanu
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          elevation: 0.0,
          title: Text('Sign in to App04 '),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
              widget.toggleView();

              },
              icon: Icon(Icons.person),
              label: Text('Register'),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(onChanged: (val) {
                  setState(() => email = val);
                }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(email);
                      print(password);
                    }),
              ],
            ),
          ),
        ));
  }
}
