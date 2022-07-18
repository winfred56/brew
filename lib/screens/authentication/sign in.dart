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
        child: ElevatedButton(
          onPressed: () async {
            // async because it has to wait for the SignInAnon function to complete
            dynamic result =await _auth.signInAnon();
            // check if the function run successfully
            if(result == null){
              print("Error trying to Sign In");
            }else{
              print("Sign In Successful");
              print(result);
            }
          },
          child: const Text("Sign In Anonymously"),
        ),
      ),
    );
  }
}
