import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  User? user;
  // create an instance of the Firebase_auth
  // _underscore before a variable makes the variable private. Thus you can't use it outside this file
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a Stream
  Stream<User?> getUser(){
    //print(_auth.authStateChanges());
    return _auth.authStateChanges();
  }

  // Sign In Anonymously
  Future signInAnon() async {
    try {
      UserCredential results = await _auth.signInAnonymously();
      user = results.user;
      return user?.uid;

    } on Exception catch (e) {
      print(e.toString());
      return null;
    }

  }

  // Sign In with Email and Password

  //Register with Email and Password

  // Sign Out
}