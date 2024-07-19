import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/pages/home_page.dart';
import 'package:firebase_lesson/pages/registe_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String? email, password;

  bool gorunurluk = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.contains("@") && value.isNotEmpty) {
                    return null;
                  } else {
                    return "Hatalı giriş !";
                  }
                },
                onSaved: (newValue) {
                  email = newValue;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text("E-posta"),
                ),
                autofillHints: const [AutofillHints.email],
              ),
              const SizedBox(
                height: 11,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: "ahmetridvanordulu@gmail.com");
                      },
                      child: const Text("Şifremi unuttum"))),
              const SizedBox(
                height: 11,
              ),
              TextFormField(
                obscureText: gorunurluk,
                validator: (value) {
                  // hataları göstermeye yarıyor
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Hatalı giriş !";
                  }
                },
                onSaved: (newValue) {
                  password = newValue;
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          gorunurluk = !gorunurluk;
                        });
                      },
                      icon: Icon(gorunurluk
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  label: const Text("Parola"),
                ),
                autofillHints: const [AutofillHints.password],
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                  onPressed: () {
                    _formkey.currentState!.validate();
                    _formkey.currentState!.save();

                    _sign(email!, password!);
                  },
                  child: const Text("Giriş yap")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                  },
                  child: const Text("Henüz bir hesabın yokmu"))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Giriş yap"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  _sign(String email, String password) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } catch (e) {
      debugPrint("hata $e");
    }
  }
}
