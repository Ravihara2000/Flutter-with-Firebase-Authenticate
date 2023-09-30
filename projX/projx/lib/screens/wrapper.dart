import 'package:flutter/material.dart';
import 'package:projx/screens/authentication/authenticate.dart';
import 'package:projx/screens/authentication/login.dart';

 class Wrapper extends StatelessWidget {
   const Wrapper({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
      home: Sign_In(),
     );
   }
 }