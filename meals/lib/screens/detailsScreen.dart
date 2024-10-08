import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
import 'package:meals/models/mealModel.dart';
import 'package:transparent_image/transparent_image.dart';

class Detailsscreen extends StatelessWidget {
  Detailsscreen({super.key, required this.m1});

  MealModel m1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(m1.title, context),
      body: Center(
        child: Column(
          children: [
            Image.network(
              m1.imageUrl,
              height: 333,
              width: double.infinity,
              fit: BoxFit.scaleDown,
            )
          ],
        ),
      ),
    );
  }
}
