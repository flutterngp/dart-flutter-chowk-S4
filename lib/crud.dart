import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

final docRef = db.collection('Users').doc();

class Crud {
  Future create(String name) async {
    await docRef.set({
      "name": name,
    });
  }

  // Future update() async{
  //   await docRef.delete();
  //   await docRef.update(data);
  //   await docRef.snapshots();
  // }
}
