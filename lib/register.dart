import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                body: Container(
                  height: (MediaQuery.of(context).size.height),
                  width: (MediaQuery.of(context).size.width),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: const Text('REGISTER',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Josefins'))),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: email,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
                            child: const Text('Register',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2.0,
                                    fontFamily: 'Josefins')),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              } catch (e) {
                                print(e);
                              }
                            },
                          )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Sudah Punya Akun?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w800)),
                          TextButton(
                            child: const Text('Login',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                          )
                        ],
                      )),
                    ],
                  ),
                ))));
  }
}
