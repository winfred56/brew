import 'package:flutter/material.dart';
import 'package:brew/shared/constants.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List sugars = ['1','2','3','4','5'];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

