import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseBuilder extends StatelessWidget {
  ExpenseBuilder({
    super.key,
    required this.expenses,
  });

  List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: items,
    );
  }

  Widget? items(BuildContext context, int sayi) {
    return ExpenseItem(e1: expenses[sayi]);
  }
}
