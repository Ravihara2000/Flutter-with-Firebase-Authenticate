import 'package:flutter/material.dart';
import 'package:projx/screens/authentication/register.dart';
import 'package:projx/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});


  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
   bool signinPage = true;
    //toggle pages
  void switchPages() {
    setState(() {
      signinPage = !signinPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (signinPage == true) {
      return Sign_In(toggle: switchPages);
    } else {
      return Register(toggle: switchPages);
    }
  
  }
}
