import 'package:firebase_auth/firebase_auth.dart';
import 'package:insoulsocial/models/user.dart';

class FirebaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  annonymouslogin() async {
    return await _auth.signInAnonymously();
  }

  Future<UserCredential> loginUsernamePassword(
      String email, String password) async {
    try {
      UserCredential _user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  logout() {
    _auth.signOut();
  }

  logedcurrentUser() {
    try {
      var usr = _auth.currentUser;

      MyUser myUser = MyUser(usr.email);
      return myUser;
    } catch (e) {
      return null;
    }
  }
}
