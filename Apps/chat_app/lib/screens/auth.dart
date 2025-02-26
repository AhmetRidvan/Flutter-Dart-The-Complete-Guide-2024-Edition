import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  void _submit() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      if (_isLogin) {
        return;
      } else {
        try {
          final user = await _auth.createUserWithEmailAndPassword(
            email: _enteredEmail!,
            password: _enteredPassword!,
          );
          print(user);
        } on FirebaseAuthException catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message ?? "Authentication failed"),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
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
                      key: _key,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: _submit,
                            child: Text(
                              _isLogin ? "Login" : "Signup",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
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
