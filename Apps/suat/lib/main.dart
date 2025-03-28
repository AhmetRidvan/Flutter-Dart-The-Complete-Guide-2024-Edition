import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:suat/Pages/mainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); //https://youtu.be/3no4ihrucHY?si=C7jOm99EsCFHGV3u&t=301
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: Mainpage(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
    );
  }
}
