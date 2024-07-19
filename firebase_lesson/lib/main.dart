import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/firebase_options.dart';
import 'package:firebase_lesson/pages/login_page.dart';
import 'package:firebase_lesson/pages/registe_page.dart';
import 'package:flutter/material.dart';
// credential la ilgili dediklerinizi anlamadım  ne işe yarıyor kimlik doğrulamadan kasıt ne burda

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
} //1.08 saat Ders kaydı: https://drive.google.com/file/d/1NFNZ-w7NQJrj8JHvqs7suoRfH5vCzUz1/vie

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
