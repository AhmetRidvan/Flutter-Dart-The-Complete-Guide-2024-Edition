import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodItem extends StatelessWidget {
  FoodItem({super.key, required this.foodModel, required this.color});

  FoodModel foodModel;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: color,
      margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(foodModel.imageUrl),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: color,
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      foodModel.title,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
