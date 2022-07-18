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
            child: Column(
              children: [
                const SizedBox(height: 20.0,),
                TextFormField(
                  onChanged: (val){
                    setState(() => email = val);
                  },

                ),
                const SizedBox(height: 20.0,),
                TextFormField(
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
                    print(email);
                    print(password);
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
