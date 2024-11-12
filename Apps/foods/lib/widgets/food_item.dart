import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodItem extends StatelessWidget {
  FoodItem({super.key, required this.foodModel});

  FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(foodModel.imageUrl)),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      softWrap: false,
                      "hi",
                      maxLines: 1,
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
