import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/Expensemodel.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _expenses();
  }
}

class _expenses extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    List<Expensemodel> FakeExpenses = [
      Expensemodel(
        title: "Cinema",
        amount: 12.33,
        date: DateTime.now(),
        category: Category.food,
      ),
      Expensemodel(
          title: "Party",
          amount: 59.33,
          date: DateTime.now(),
          category: Category.leisure),
    ];

    void openAddExtense() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return const Center(child: NewExpense());
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter ExpenseTracker",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellowAccent,
        actions: [
          IconButton(
              onPressed: openAddExtense,
              icon: const Icon(
                Icons.add,
                color: Colors.black,
                size: 35,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Grafik"),
            Expanded(child: ExpensesList(expenses: FakeExpenses)),
          ],
        ),
      ),
    );
  }
}
