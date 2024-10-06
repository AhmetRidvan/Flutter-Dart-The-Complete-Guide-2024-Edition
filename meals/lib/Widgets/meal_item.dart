import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item_trait.dart';
import 'package:meals/models/mealModel.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.m1});

  final MealModel m1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(m1.imageUrl)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(127, 255, 24, 24),
                  child: Column(
                    children: [
                      Text(
                        m1.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          MealItemTrait(
                              i: Icons.schedule, s: "${m1.duration} min")
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
