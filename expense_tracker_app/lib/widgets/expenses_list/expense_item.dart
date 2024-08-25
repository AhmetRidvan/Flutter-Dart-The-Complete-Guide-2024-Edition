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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expensemodel1.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.red), //copywith genele dokunmadan sadece o özelliği değiştirir
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "\$${expensemodel1.amount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Row(
                  children: [
                    categoryIcons2[expensemodel1.category] as Widget ,
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      expensemodel1.formattedDate,
                      style: Theme.of(context).textTheme.titleLarge,
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
