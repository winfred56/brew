import 'package:brew/models/user.dart';
import 'package:brew/services/database.dart';
import 'package:brew/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4','5'];

  late String _currentName;
  late String _currentSugars;
  int _currentStrength=100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          UserData? userData = snapshot.data;
          return Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  "Update your brew Settings",
                  style: TextStyle(fontSize: 20.0),
                ),

                const SizedBox(height: 10.0,),
                TextFormField(
                  initialValue: userData?.name,
                  decoration: formDecoration,
                  validator: (val) => val!.isEmpty ?" Please Enter a Name ": null,
                  onChanged: (val) => setState(() => _currentName = val ),
                ),
                const SizedBox(height: 20.0,),

                const SizedBox(height: 10.0,),
                //dropdown
                DropdownButtonFormField(
                  value: userData?.sugars,
                  decoration: formDecoration,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text("$sugar sugars"),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentSugars = val as String),
                ),
                const SizedBox(height: 30.0,),
                const Text(
                  "Strength of brew",
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                //slider
                Slider(
                  value: (_currentStrength ?? userData?.strength)!.toDouble(),
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  activeColor: Colors.brown[_currentStrength],
                  // inactiveColor: Colors.brown[_currentStrength],
                  onChanged: (val) => setState(() => _currentStrength = val.round()),
                ),

                //button
                ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown),
                  ),
                  onPressed: () async{
                    if(_formkey.currentState!.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                          _currentSugars,
                          _currentName,
                          _currentStrength
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        }else{
          return const Loading();
        }
      }
    );
  }
}

