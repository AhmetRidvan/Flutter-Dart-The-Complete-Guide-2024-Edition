import 'package:flutter/material.dart';

class Categorymodel {
  Categorymodel({
    required this.id,
    required this.title,
    this.color = Colors.red,
  });
  String id;
  String title;
  Color color;
}
