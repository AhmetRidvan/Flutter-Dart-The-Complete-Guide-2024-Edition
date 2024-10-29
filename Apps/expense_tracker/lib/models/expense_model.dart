import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var formattedDatetime = DateFormat.yMd();

Map categoryIcons = {
  Category.food: Icons.fastfood,
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

//Grup masrafı için
//Her kategory için  bir kova

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});
  //belirli bir kategoriye ait olan filtreme işlemi

  ExpenseBucket.forCategory(List<ExpenseModel> as, this.category)
      : expenses = as
            .where(
              (element) => element.category == category,
            )
            .toList();

  List<ExpenseModel> expenses;
  Category category;
 

  double get totalExpenses { // bir kovanın toplam harcaması
    double sayi = 0;

    for (var x in expenses) {
      sayi += x.amount;
    }

    return sayi;
  }
}
