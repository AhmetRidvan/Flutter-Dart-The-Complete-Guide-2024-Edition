import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesPage();
  }
}

class _ExpensesPage extends State<ExpensesPage> {
  final List<ExpenseModel> _fakeExpenses = [
    ExpenseModel(
        title: "C++",
        amount: 12.31,
        date: DateTime.now(),
        category: Category.food),
    ExpenseModel(
        title: "Python",
        amount: 11.94,
        date: DateTime.now(),
        category: Category.work)
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("The chart"),
          Text("Expenses list..."),
        ],
      ),
    );
  }
}
