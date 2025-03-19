import 'dart:async';

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
    CollectionReference meyveler = store.collection('Meyveler');
    final armut = meyveler.doc('4522yCgzBPZoNuDo5GHZ');
    // Future<void> printArmut() async {
    //   DocumentSnapshot data = await armut.get(); //DocumentSnapshot içinde map verir 
    //   print(data.data()); // bu map'i DocumentSnapshot'den data() diyerek çıkarırız
    // }

    // printArmut();
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
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return Text(snapshot.data!.data().toString());
          } else {
            return Text("Document does not exist");
          }
        },
      ),
    );
  }
}
