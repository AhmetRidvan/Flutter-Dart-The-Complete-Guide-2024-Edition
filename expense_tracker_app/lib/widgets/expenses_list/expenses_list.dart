import 'package:expense_tracker_app/models/Expensemodel.dart';
import 'package:flutter/cupertino.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expensemodel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Text(expenses[index].title);
      },
    ); // Gerektiği kadar eleman gösterir en optimumu
  }
}
