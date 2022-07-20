import 'package:flutter/material.dart';
import 'package:brew/shared/constants.dart';

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
  late String _currentStrengt;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
        child: Column(
          children: [
            const Text(
              "Update your brew Settings",
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              decoration: formDecoration,
              validator: (val) => val!.isEmpty ?" Please enter a name ": null,
              onChanged: (val) => setState(() => _currentName = val ),
            ),
          ],
        ),
    );
  }
}

