import 'package:brew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew/services/database.dart';
import 'package:brew/models/brew.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an instance of AuthService class
    AuthService _auth = AuthService();
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService.withoutUID().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text("Sign In To Brew"),
          elevation: 0.0,
          actions: [
            TextButton.icon(
                onPressed: ()async{
                  await _auth.signOut();
                },
                icon: const Icon(
                    Icons.logout,
                  color: Colors.white,
                ),
                label: const Text(
                  "Logout",
                style: TextStyle(
                  color: Colors.white
                ),
                )),
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}

