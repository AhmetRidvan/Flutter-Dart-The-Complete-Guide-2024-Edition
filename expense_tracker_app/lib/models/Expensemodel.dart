import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var xes = DateFormat.yMd(); // tarihleri biçimlendirmek için yMd

var uuid1 = const Uuid();

enum Category {
  food,
  travel,
  leisure,
  work
} // Rastgele parametre giremesin benim dediğim parametleri girebilsin

var categoryIcons = {
  Category.food: const Icon(Icons.food_bank),
  Category.travel: const Icon(Icons.card_travel),
  Category.leisure: const Icon(Icons.movie_filter_sharp),
  Category.work: const Icon(Icons.work),
};

class Expensemodel {
  Expensemodel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid1.v4(); //ilklendirme

  String id;
  String title;
  double amount;
  DateTime date;
  Category category;

  String get formattedDate {
    return xes.format(date);
  }
}
