import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodsDetails extends StatelessWidget {
  FoodsDetails({super.key, required this.foodModel, required this.color});

  FoodModel foodModel;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: apb(foodModel.title, color, context),
      body: Column(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(33),
              child: FadeInImage(
                  width: 370,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(foodModel.imageUrl)),
            ),
          ),
        ],
      ),
    );
  }
}
