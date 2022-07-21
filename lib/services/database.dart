import 'package:brew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DatabaseService{

  late final String uid;
  DatabaseService({required this.uid});
  DatabaseService.withoutUID():uid="" ;

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  // function to create a user document in Firestore
  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  //
  List<Brew> _brewListFromSnapshot (QuerySnapshot snapshot){
    return snapshot.docs.map((document){
      return Brew(
          strength: document['strength'] ?? 0,
          name: document['name'] ?? '',
          sugars: document['sugars'] ?? '');
    }).toList();
  }

  //userData from Snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
        sugars: data['sugars'],
        name: data['name'],
        uid: uid,
        strength: data['strength']
    );
  }

  // Stream to get updates on brews
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

  //get Stream doc
  Stream<DocumentSnapshot> get userData{
    return brewCollection.doc(uid).snapshots();
  }

}