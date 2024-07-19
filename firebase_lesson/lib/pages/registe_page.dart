import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password;

  bool gorunurluk = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
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
                    icon: Icon(
                        gorunurluk ? Icons.visibility : Icons.visibility_off)),
                label: const Text("Parola"),
              ),
              autofillHints: const [AutofillHints.password],
            ),
            ElevatedButton(
                onPressed: () {
                  _formkey.currentState!.validate();
                  _formkey.currentState!.save();

                  _createUserWithEmailAndPassword(email!, password!);
                },
                child: const Text("Kaydol"))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Kayıt ol"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  _createUserWithEmailAndPassword(String email, String password) async {
    try {
      final user = FirebaseAuth.instance;
      await user.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      debugPrint("Bir hata meydana geldi $e");
    }
  }
}
