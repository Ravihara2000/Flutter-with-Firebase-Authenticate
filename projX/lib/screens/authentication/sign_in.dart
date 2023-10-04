import 'package:flutter/material.dart';
import 'package:projx/constants/colors.dart';
import 'package:projx/constants/description.dart';
import 'package:projx/constants/styles.dart';

import '../../services/auth.dart';

class Sign_In extends StatefulWidget {
  //fucntion
  final Function toggle;

  const Sign_In({Key? key, required this.toggle}) : super(key: key);

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
        resizeToAvoidBottomInset: false,
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: textInputDecoration,
                          validator: (val) => val?.isNotEmpty == true
                              ? "Enter valid email"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //pw
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: textInputDecoration.copyWith(
                              hintText: "Password"),
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
                          onTap: () {},
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
                              onTap: () {
                                widget.toggle();
                                ();
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(color: mainBlue),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //login user
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: bgBlack,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 2, color: mainYellow)),
                            child: Center(
                              child: const Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //anno btn
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: bgBlack,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: mainBlue)),
                            child: Center(
                              child: const Text(
                                "LOG IN AS GUEST",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )

                        //anno
                      ],
                    )),
              )
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
