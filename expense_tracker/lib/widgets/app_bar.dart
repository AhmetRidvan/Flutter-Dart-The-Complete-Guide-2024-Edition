import 'package:flutter/material.dart';

AppBar appBar(Function f1) {
  return AppBar(
    title: const Text(
      "Expense tracker",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
   
    actions: [
      IconButton(
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
