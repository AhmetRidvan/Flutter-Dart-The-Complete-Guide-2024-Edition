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
  int number = 0;
  void whenPressed() {
    final db = FirebaseFirestore.instance;
    final col = db.collection('testCollection');
    col.add({'test': number});
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(number.toString()),),
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
    );
  }
}
