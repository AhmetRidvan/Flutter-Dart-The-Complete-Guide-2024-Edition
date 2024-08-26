import 'package:uuid/uuid.dart';

const u1 = Uuid();

class ExpenseModel {
  ExpenseModel({required this.title, required this.amount, required this.date})
      : id = u1.v1();

  String id;
  String title;
  double amount;
  DateTime date;
}
