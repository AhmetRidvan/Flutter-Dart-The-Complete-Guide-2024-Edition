import 'dart:math';
import 'package:first_app/styledtext.dart';
import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

// Repetition & Exercise: Adding a Stateful Widget bitir.

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: GradiantContainer(
      renkler: const [Colors.redAccent, Colors.teal],
    )),
  ));
}
// extends özellikleri işlevleri almak