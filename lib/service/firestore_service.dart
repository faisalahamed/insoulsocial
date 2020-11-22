import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  var userref = FirebaseFirestore.instance.collection('user');

  createUser() {
    userref.add({'name': 'add new user'});
  }
}
