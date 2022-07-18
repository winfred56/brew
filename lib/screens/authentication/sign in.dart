import 'package:brew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // create an instance of the AuthService class to access its methods/functions
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text("Sign In To Brew"),
        elevation: 0.0,
        centerTitle: true,
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
                  child: const Text("Sign In",
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
