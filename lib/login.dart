import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petshop/home.dart';
import 'package:petshop/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
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
                          child: const Text('LOGIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800))),
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
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: const Text('Login',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2.0,
                                )),
                          )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Text('Buat akun baru?',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              )),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text('Daftar',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                )),
                          )
                        ],
                      )),
                    ],
                  ),
                ))));
  }
}
