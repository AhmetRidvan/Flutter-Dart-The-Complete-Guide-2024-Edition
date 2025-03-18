import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:suat/Pages/mainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); //https://www.youtube.com/watch?v=dy8IDvLRMN8&list=PLJ5EAGz05Q3Eh6Qvly8qoA1y8VSPdt_ke&index=9 4.47
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
