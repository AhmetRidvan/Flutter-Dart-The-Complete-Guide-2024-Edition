import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.lightBlue, Colors.amberAccent],
            ),
          ),
          child: const Center(
              child: Text(
            'Hello World',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
            ),
          ))),
    ),
  ));
}

class