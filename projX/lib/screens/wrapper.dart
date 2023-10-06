import 'package:flutter/material.dart';
import 'package:projx/models/UserModel.dart';
import 'package:projx/screens/authentication/authenticate.dart';
import 'package:projx/screens/authentication/register.dart';
import 'package:projx/screens/authentication/sign_in.dart';
import 'package:projx/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

    //return Authenticate();
  }
}
