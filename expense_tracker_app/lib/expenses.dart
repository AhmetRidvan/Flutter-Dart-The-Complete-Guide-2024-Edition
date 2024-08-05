import 'package:expense_tracker_app/models/expense.dart';
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
    List<Expensemodel> FakeExpenses= [
        Expensemodel(title: "Cinema", amount: 12.33, date: DateTime.now(), category: Category.food),
        Expensemodel(title: "Party", amount: 59.33, date: DateTime.now(), category: Category.leisure),
    ];
    
   
    return const Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Text("Expenses list.."),
        ],
      ),
    );
  }
}
