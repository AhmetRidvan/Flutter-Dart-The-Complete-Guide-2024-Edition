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
  List<Expensemodel> FakeExpenses = [
    Expensemodel(
      title: "Cinema",
      amount: 12.33,
      date: DateTime.now(),
      category: CategoryEnum.food,
    ),
    Expensemodel(
        title: "Party",
        amount: 59.33,
        date: DateTime.now(),
        category: CategoryEnum.leisure),
  ];

  void openAddExtense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Center(
            child: NewExpense(
          incomingFunction: _addExpense,
        ));
      },
    );
  }

  void _addExpense(Expensemodel e1) {
    setState(() {
      FakeExpenses.add(e1);
    });
  }

  @override
  Widget build(BuildContext context) {
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
