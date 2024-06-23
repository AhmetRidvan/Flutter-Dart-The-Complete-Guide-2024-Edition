import 'dart:math';
import 'package:first_app/styledtext.dart';
import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';
//2:36 
//Module Summary bitir.

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: GradiantContainer(
      colors: const [Colors.pinkAccent, Colors.teal],
    )), 
  ));
}
// extends özellikleri işlevleri almak