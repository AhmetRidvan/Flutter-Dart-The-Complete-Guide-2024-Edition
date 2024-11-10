import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';

class FoodItem extends StatelessWidget {
  FoodItem({super.key, required this.foodModel});

  FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}
