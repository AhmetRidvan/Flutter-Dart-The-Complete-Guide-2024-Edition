import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _mainPage();
  }
}

class _mainPage extends State<Mainpage> {
  final store = FirebaseFirestore.instance;

  void whenPressed() {}

  @override
  Widget build(BuildContext context) {
    final movies = store.collection('movies');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: whenPressed,
        child: Icon(Icons.radio_button_checked),
      ),
      appBar: AppBar(
        title: Text("Hi"),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,

        centerTitle: true,
      ),
      body: Center(child: Text(movies.path)),
    );
  }
}
