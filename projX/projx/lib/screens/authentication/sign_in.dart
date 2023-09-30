import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //ref for Autheservices class
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: ElevatedButton(
        child: const Text("Sign In annonymously"),
        onPressed: () async {
          dynamic result = await _auth.signInAnonymously();
          if (result == Null) {
            print("error in sign in ");
          } else {
            print("Sign in annonymously");
            print(result);
          }
        },
      ),
    );
  }
}
