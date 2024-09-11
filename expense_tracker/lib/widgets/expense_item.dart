import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.e1});
  ExpenseModel e1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              e1.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
