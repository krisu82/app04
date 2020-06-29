import 'package:app04/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

// tworze user obj bazujac na firebaseUser

User _userFromFirebaseUser(FirebaseUser user) {
return user != null ? User (uid: user.uid) : null;
}

// sign in anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email  pass

// register with email i pass

// sign out

}
