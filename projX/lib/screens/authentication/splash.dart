import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projx/constants/colors.dart';
import 'package:projx/screens/wrapper.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Image.asset(
                  'assets/splashImg.png',
                  height: 300,
                ),
              ),
              SizedBox(
                height: 110,
              ),
              Text("| All rights reserved |",style: TextStyle(
                color: mainYellow,
              ),),
              SizedBox(
                height: 10,
              ),
              Text("Application By Ravihara De Silva",style:TextStyle(
                fontWeight: FontWeight.w800,
                color: mainYellow,
                fontSize: 20,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
