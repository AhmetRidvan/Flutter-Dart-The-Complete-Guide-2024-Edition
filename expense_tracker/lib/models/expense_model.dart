import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var formattedDatetime = DateFormat.yMd();

Map categoryIcons = {
  Category.food:  Icons.fastfood,
  Category.leisure: Icons.games,
  Category.travel: Icons.luggage_rounded,
  Category.work: Icons.work
};

enum Category {
  food,
  travel,
  leisure,
  work,
}

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = Uuid().v1(); // ilklendirme

  String id;
  String title;
  double amount;
  DateTime date;
  Category category;

  String get formatter {
    return formattedDatetime.format(date); 
  }
}
