import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  late final String uid;
  DatabaseService({required this.uid});

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  // function to create a user document in Firestore
  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

}