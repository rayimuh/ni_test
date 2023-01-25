import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              Text("To-Do Apps",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold)),
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Masukkan Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      labelText: "Masukkan Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () async{
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: pass.text)
                              .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage())));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(child: Center(child: Text("Wrong Email"),),height: 50),
                                  );
                                });
                          } else if (e.code == "wrong-password") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(child: Center(child: Text("Wrong Password"),),height: 50),
                                  );
                                });
                          }
                        }
                      },
                      child: Center(
                        child: Text("LOG IN"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Center(
                        child: Text("SIGN UP"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
