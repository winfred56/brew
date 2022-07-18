import 'package:brew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email='';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text("Sign Un To Brew"),
        elevation: 0.0,
          actions: [
            TextButton.icon(onPressed: (){
              widget.toggleView();
            },
              icon: const Icon(
                Icons.login,
                color: Colors.white,
              ),
              label: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 20.0,),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Enter an Email address" : null,
                  onChanged: (val){
                    setState(() => email = val);
                  },

                ),
                const SizedBox(height: 20.0,),
                TextFormField(
                  validator: (val) => val!.length < 4 ? "Password must be at least 4 characters long" : null,
                  onChanged: (val){
                    setState(() => password = val );
                  },
                  obscureText: true,

                ),
                const SizedBox(height: 20.0,),
                ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown),
                  ),
                  onPressed: ()async{
                    if (_formkey.currentState!.validate()){
                      print(email);
                      print(password);
                    }

                  },
                  child: const Text("Register",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
