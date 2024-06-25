import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

//6.50

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Colors.lightBlueAccent,
                Colors.pinkAccent,
                Colors.deepOrangeAccent,
              ])),
          child: const StartScreen()),
    ),
  ));
}