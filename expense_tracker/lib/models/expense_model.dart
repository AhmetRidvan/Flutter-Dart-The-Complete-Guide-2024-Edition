import 'package:uuid/uuid.dart';

const u1 = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}

class ExpenseModel {
  ExpenseModel({required this.title, required this.amount, required this.date,required this.category})
      : id = u1.v1(); // ilklendirme

  String id;
  String title;
  double amount;
  DateTime date;
  Category category;
}
