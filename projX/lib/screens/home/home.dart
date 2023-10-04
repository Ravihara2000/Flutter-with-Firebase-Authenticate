import 'package:flutter/material.dart';
import 'package:projx/constants/colors.dart';
import 'package:projx/constants/description.dart';
import 'package:projx/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create a object from auth Services
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: bgBlack,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: bgBlack,
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(bgBlack),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  child: const Icon(Icons.logout),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: textLight,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                    Center(
                        child: Image.asset(
                      'assets/man.png',
                      height: 200,
                    ))
                  ],
                ),
              ),
            )));
  }
}
