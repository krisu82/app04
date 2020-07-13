import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference appCollection =
      Firestore.instance.collection('app');

  Future updateUserData(String sugars, String name, int strength) async {
    return await appCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

//weź stream app04
Stream<QuerySnapshot> get app04 {
return appCollection.snapshots();

}

}
