import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "Masukkan Nama",
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
              Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(                      
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: pass.text).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));                       
                      },
                      child: Center(
                        child: Text("SIGN UP"),
                      ),
                    ),
                  ),             
            ],
          ),
        ),
      ),
    );
  }
}
