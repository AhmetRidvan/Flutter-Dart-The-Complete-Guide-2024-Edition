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

  @override
  Widget build(BuildContext context) {
    final meyveler = store.collection('Meyveler');
    final armut = meyveler.doc('NSOgOIRrKbKppcgtiR0u');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: Icon(Icons.radio_button_checked),
      ),
      appBar: AppBar(
        title: Text("Hi"),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,

        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: armut.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Text(snapshot.data.data()); // left 12 
        },
      ),
    );
  }
}
