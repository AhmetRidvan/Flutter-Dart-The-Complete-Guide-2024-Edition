import 'package:expense_tracker_app/models/Expensemodel.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses, required this.sil});

  final List<Expensemodel> expenses;
  Function(Expensemodel m2) sil;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
            onDismissed: (direction) => sil(expenses[index]),
            key:  ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index]));
      },
    ); // Gerektiği kadar eleman gösterir en optimumu
  }
}
//15