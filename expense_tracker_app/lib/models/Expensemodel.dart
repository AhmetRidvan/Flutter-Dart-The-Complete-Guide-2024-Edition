import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var xes = DateFormat.yMd(); // tarihleri biçimlendirmek için yMd

var uuid1 = const Uuid();

enum CategoryEnum {
  food,
  travel,
  leisure,
  work
} // Rastgele parametre giremesin benim dediğim parametleri girebilsin

var categoryIcons = {
  CategoryEnum.food: const Icon(Icons.food_bank),
  CategoryEnum.travel: const Icon(Icons.card_travel),
  CategoryEnum.leisure: const Icon(Icons.movie_filter_sharp),
  CategoryEnum.work: const Icon(Icons.work),
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
  CategoryEnum category;

  String get formattedDate {
    return xes.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.c1, required this.l1});

  CategoryEnum c1;
  List<Expensemodel> l1;

  //1:40
}
