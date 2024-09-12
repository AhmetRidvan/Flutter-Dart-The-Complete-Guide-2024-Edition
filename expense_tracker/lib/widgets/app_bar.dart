import 'package:flutter/material.dart';

AppBar appBar(Function f1, BuildContext context) {
  return AppBar(
    title: Text(
      "Expense tracker",
      style: Theme.of(context).textTheme.titleLarge,
    ),
    actions: [
      IconButton(
          color: Theme.of(context).textTheme.titleLarge!.color,
          onPressed: () {
            whenTouched(f1);
          },
          icon: Icon(
            Icons.add_circle_outline_sharp,
            size: 40,
          ))
    ],
  );
}

whenTouched(Function f1) {
  f1();
}
