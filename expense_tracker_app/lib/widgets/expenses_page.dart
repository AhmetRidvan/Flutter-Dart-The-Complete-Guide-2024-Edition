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
        title: "asd",
        amount: 12,
        date: DateTime.now(),
        category: CategoryEnum.food),
    Expensemodel(
        title: "hjk",
        amount: 132,
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

  void _removeExpense(Expensemodel e1) {
    var index = FakeExpenses.indexOf(
        e1); // bu nesnenin kaçıncı indexte olduğunu buluyoruz.
    setState(() {
      FakeExpenses.remove(e1);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            FakeExpenses.insert(index, e1); // o indexe eklemeye yarıyor
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Expanded(
        child: ExpensesList(
      expenses: FakeExpenses,
      sil: _removeExpense,
    ));

    if (FakeExpenses.isEmpty) {
      mainContent = const Center(
        child: Text("There is nothing here"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter ExpenseTracker",
          style: TextStyle(
           
            fontWeight: FontWeight.bold,
          ),
        ),
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
            mainContent,
          ],
        ),
      ),
    );
  }
}
