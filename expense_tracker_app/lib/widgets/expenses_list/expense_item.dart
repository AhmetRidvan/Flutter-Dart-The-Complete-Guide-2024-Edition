import 'package:expense_tracker_app/models/Expensemodel.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expensemodel1, {super.key});

  Expensemodel expensemodel1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expensemodel1.title),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text("\$${expensemodel1.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    categoryIcons[expensemodel1.category] as Widget,
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      expensemodel1.formattedDate,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
