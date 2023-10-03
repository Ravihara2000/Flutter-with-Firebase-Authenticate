import 'package:flutter/material.dart';
import 'package:projx/constants/colors.dart';
import 'package:projx/constants/description.dart';
import 'package:projx/constants/styles.dart';

import '../../services/auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //ref for Autheservices class
  final AuthServices _auth = AuthServices();

  //form key
  final _formKey = GlobalKey<FormState>();
  //email pw states
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: const Text("Sign In"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              //description
              const Text(
                description,
                style: descriptionStyle,
              ),
              Center(
                  child: Image.asset(
                'assets/man.png',
                height: 200,
              )),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        validator: (val) => val?.isNotEmpty == true
                            ? "Enter valid email"
                            : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      //pw
                      TextFormField(
                        validator: (val) =>
                            val!.length < 6 ? "Enter a valid password" : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      //btn
                      //google
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        //sign in with google acc
                        onTap: (){},
                        child: Center(
                            child: Image.asset(
                          'assets/google.png',
                          height: 50,
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do not have an account?",
                            style: descriptionStyle,
                            ),
                                                  const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        //move to regsiter page
                        onTap: () {},
                        child: const Text(
                          "Register",
                          style: TextStyle(color:mainBlue),
                        ),
                      )

                        ],
                      )
                      

                      //anno
                    ],
                  ))
            ],
          ),
        ));
  }
}


// ElevatedButton(
//         child: const Text("Sign In annonymously"),
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymously();
//           if (result == Null) {
//             print("error in sign in ");
//           } else {
//             print("Sign in annonymously");
//             print(result.uid);
//           }
