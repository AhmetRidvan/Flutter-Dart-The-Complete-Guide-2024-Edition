import 'package:flutter/material.dart';
import 'package:meals/models/mealModel.dart';
import 'package:meals/widgets/appbar.dart';

class Meals extends StatelessWidget {
  Meals({super.key, required this.title, required this.mealsList});

  final String title;
  final List<MealModel> mealsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title, context), 
    );
  }
}
