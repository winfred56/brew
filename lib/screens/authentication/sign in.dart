import 'package:brew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();


}

class _SignInState extends State<SignIn> {
  // create an instance of the AuthService class to access its methods/functions
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
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
        actions: [
          TextButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: const Icon(
                Icons.person_add_alt,
                color: Colors.white,
              ),
              label: const Text(
                "Register",
              style: TextStyle(
                color: Colors.white,
              ),
              ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter a valid Email address" : null,
                onChanged: (val){
                  setState(() => email = val);
                },

              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val!.length < 4 ? "Password must be at least 4 characters long": null,
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
                  if(_formkey.currentState!.validate()){
                    print(email);
                    print(password);
                  };
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
