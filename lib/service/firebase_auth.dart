import 'package:firebase_auth/firebase_auth.dart';
import 'package:insoulsocial/models/user.dart';
import 'package:insoulsocial/service/firestore_service.dart';

class FirebaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();

  annonymouslogin() async {
    return await _auth.signInAnonymously();
  }

  Future<UserCredential> signup(String email, String password) async {
    try {
      UserCredential newuser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return newuser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserCredential> loginUsernamePassword(
      String email, String password) async {
    try {
      var res = await _firestoreService.createUser();
      print(res);
      UserCredential _user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void logout() {
    _auth.signOut();
  }

  MyUser logedcurrentUser() {
    try {
      var usr = _auth.currentUser;
      MyUser myUser = MyUser(usr.email);
      return myUser;
    } catch (e) {
      return null;
    }
  }
}
