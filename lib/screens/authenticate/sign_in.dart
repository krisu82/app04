import 'package:app04/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:app04/shared/constants.dart';
import 'package:app04/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

// textowe pole stanu
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
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
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Wprowadź email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Hasło'),
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Hasło musi mieć conajmniej 6 znaków'
                        : null,
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
                      if (_formKey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(
                              () => error = 'Wprowadź poprawny login i hasło');
                        loading = false;
                        }
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ));
  }
}
