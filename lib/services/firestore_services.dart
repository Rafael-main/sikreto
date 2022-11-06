import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSikreto {
  var db = FirebaseFirestore.instance;

  addSikretoPass(String uuid, Map<String, dynamic> data) {
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future readSikretoPass() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
}
