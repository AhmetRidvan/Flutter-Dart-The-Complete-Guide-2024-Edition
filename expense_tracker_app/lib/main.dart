import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_page.dart';

// 1:30
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
