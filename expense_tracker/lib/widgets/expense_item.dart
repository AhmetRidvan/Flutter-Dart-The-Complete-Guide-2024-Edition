import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.e1});
  ExpenseModel e1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Text(e1.title),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("\$ ${e1.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                  Icon(categoryIcons[e1.category]),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(e1.formatter)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
