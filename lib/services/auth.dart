import 'package:brew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  // create an instance of the Firebase_auth
  // _underscore before a variable makes the variable private. Thus you can't use it outside this file
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // Create User Object
  // Users? _usersFromFirebase(User user){
  //   return user != null ? Users(uid: user.uid) : null;
  // }


  // Sign In Anonymously
  Future signInAnon() async {
    try {
      UserCredential results = await _auth.signInAnonymously();
      User? user = results.user;
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