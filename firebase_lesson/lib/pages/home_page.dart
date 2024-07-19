import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? u1 = FirebaseAuth.instance.currentUser;

    u1!.updateDisplayName("Merhaba birader").then(
      (value) {
        debugPrint(u1.email);
        debugPrint(u1.uid);
        debugPrint(u1.displayName);
        debugPrint("${u1.emailVerified}");
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  u1.sendEmailVerification();
                },
                child: const Text("Gönder")),
            const Text("Home Page"),
          ],
        ),
      ),
    );
  }
}
