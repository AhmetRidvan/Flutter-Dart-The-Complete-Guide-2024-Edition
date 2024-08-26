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
  ExpenseModel e1 =
      ExpenseModel(title: "asd", amount: 34, date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    e1.id;
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
