//THIS IS AUTHENTICATION FUNCTION CODES
//Sign In, New Registration , Sign out etc. auth functions are used here

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezeria/Screens/services/database.dart';
import 'package:freezeria/req_info/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userId(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) {
      return _userId(user);
    });
  }

//Sign in anonynous
  Future signAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userId(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign Out
  Future userSignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Register
  Future registerEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
      FirebaseUser user = result.user;
      await Database(uid: user.uid )
     .updateData('Small', 'New user', 100, 'Chocolate', 'Oreo', 'Vanilla', 'Chocolate', 'Cherry');
      return _userId(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//Sign In
  Future signInEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
      email: email, password: password);
      FirebaseUser user = result.user;
      return _userId(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
