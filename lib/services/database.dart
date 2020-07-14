import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app04/models/app04.dart';
import 'package:app04/models/user.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference app04Collection =
      Firestore.instance.collection('app');

  Future updateUserData(String sugars, String name, int strength) async {
    return await app04Collection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

// app04 list ze snashot

  List<App04> _app04ListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return App04(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 1,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

//userData ze snapshota

UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
return UserData(
uid: uid,
name: snapshot.data['name'],
sugars: snapshot.data['sugars'],
strength: snapshot.data['strength'],

);

}

//weź stream app04s
  Stream<List<App04>> get app04s {
    return app04Collection.snapshots()
    .map(_app04ListFromSnapshot);
  }

//weż stream dokument uzytkownika

Stream<UserData> get userData {
return app04Collection.document(uid).snapshots()
.map(_userDataFromSnapshot);

}

}
