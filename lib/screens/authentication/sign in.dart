import 'package:brew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew/shared/constants.dart';
import 'package:brew/shared/loading.dart';


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
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return loading ? const Loading() : Scaffold(
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
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              TextFormField(
                decoration: formDecoration.copyWith(hintText: "Email"),
                validator: (val) => val!.isEmpty ? "Enter a valid Email address" : null,
                onChanged: (val){
                  setState(() => email = val);
                },

              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                decoration: formDecoration.copyWith(hintText: "Password"),
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
                    setState(() {
                      loading = true;
                    });
                    if (_formkey.currentState!.validate()){
                      // dynamic because it may return either a null or a user
                      dynamic results = await _auth.signInWithEmailAndPassword(email, password);
                      // print(results.email);
                      if(results == null){
                        setState(() {
                          loading = false;
                          error = "Enter Valid Credentials";
                        });
                      }
                    }
                  }
                  },
                  child: const Text("Sign In",
                    style: TextStyle(
                      color: Colors.white
                    ),
              ),
              ),
              const SizedBox(height: 12.0,),
              Text(error,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14.0
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
