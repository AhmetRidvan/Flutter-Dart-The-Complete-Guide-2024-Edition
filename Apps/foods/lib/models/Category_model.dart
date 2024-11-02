import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel(
      {required this.id, required this.title, this.color = Colors.red});

  String id;
  String title;
  Color color;
}
