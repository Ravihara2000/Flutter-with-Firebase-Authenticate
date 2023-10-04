import 'package:flutter/material.dart';
import 'package:projx/constants/colors.dart';
import 'package:projx/constants/description.dart';
import 'package:projx/constants/styles.dart';
import 'package:projx/services/auth.dart';

class Register extends StatefulWidget {
  //fucntion
  final Function toggle;

  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //ref for Autheservices class
  final AuthServices _auth = AuthServices();

  //form key
  final _formKey = GlobalKey<FormState>();
  //email pw states
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: const Text("Register"),
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
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: textInputDecoration.copyWith(
                              hintText: "Passowrd"),
                          validator: (val) => val!.length < 6
                              ? "Password must be at leaset 6 characters"
                              : null,
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
                        Text(
                          error,
                          style: TextStyle(color: Colors.red) ,
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
                              "Already have an account?",
                              style: descriptionStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              //move to sign in page

                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "Log In",
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
                          onTap: () async {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              //err
                              setState(() {
                                error = "Please enter a valid email";
                              });
                            }
                          },
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
                                "REGISTER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),

                        //anno
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
