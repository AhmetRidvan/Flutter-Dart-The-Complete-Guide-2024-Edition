import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/modal.dart';
import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:expense_tracker/widgets/expense_builder.dart';
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

  void _addToList(ExpenseModel a1) {
    setState(() {
      _fakeExpenses.add(a1);
    });
  }

  addExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Modal(
          onData: _addToList,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(addExpense),
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(child: ExpenseBuilder(expenses: _fakeExpenses)),
        ],
      ),
    );
  }
}
