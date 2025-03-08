import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chat_app/widgets/user_image_picker.dart';

final _auth = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _authScreen();
  }
}

class _authScreen extends State<AuthScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLogin = true;
  String? _enteredEmail = "";
  String? _enteredPassword = "";
  File? incomingPicture;
  bool isTrying = false;

  void _submit() async {
    if (_key.currentState!.validate()) {
      if ((!_key.currentState!.validate()) ||
          (!_isLogin && incomingPicture == null)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No picture added!"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return;
      }

      _key.currentState!.save();
      try {
        setState(() {
          isTrying = true;
        });
        if (_isLogin) {
          final userCredentials = await _auth.signInWithEmailAndPassword(
            email: _enteredEmail!,
            password: _enteredPassword!,
          );
        } else {
          final userCredentials = await _auth.createUserWithEmailAndPassword(
            email: _enteredEmail!,
            password: _enteredPassword!,
          );

          final refer = FirebaseStorage.instance
              .ref()
              .child('user_images')
              .child('${userCredentials.user!.uid}.jpg'); //dosyanın referansı (işaret etmek.)
          await refer.putFile(incomingPicture!);
          String imageUrl = await refer.getDownloadURL(); 

          FirebaseFirestore.instance.collection('users').doc(userCredentials.user!.uid);
        }
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? "Authentication failed"),
            backgroundColor: Colors.redAccent,
          ),
        );
        setState(() {
          isTrying = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(25),
                width: 250,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(20),
                color: Theme.of(context).colorScheme.onPrimary,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      //FormState durum yönetimi yapar.
                      key: _key,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin)
                            UserImagePicker(
                              sendPicture: (pic) {
                                setState(() {
                                  incomingPicture = pic;
                                });
                              },
                            ),
                          TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return "Please enter a valid email adress";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredEmail = newValue;
                            },
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text("Email Address"),
                            ),
                            textCapitalization: TextCapitalization.none,
                          ),
                          TextFormField(
                            onSaved: (newValue) {
                              _enteredPassword = newValue;
                            },
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return "Password must be at least 6 characters long";
                              } else {
                                return null;
                              }
                            },
                            autocorrect: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text("Password"),
                            ),
                          ),
                          SizedBox(height: 10),
                          if (isTrying) CircularProgressIndicator(),
                          if (!isTrying)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: _submit,
                              child: Text(
                                _isLogin ? "Login" : "Signup",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          if (!isTrying)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? "Create an account"
                                    : "I already have an account",
                              ),
                            ),
                        ],
                      ),
                    ),
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
