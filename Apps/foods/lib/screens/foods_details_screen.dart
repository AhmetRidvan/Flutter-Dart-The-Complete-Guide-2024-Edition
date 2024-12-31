import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodsDetailsScreen extends StatelessWidget {
  FoodsDetailsScreen(
      {super.key,
      required this.foodModel,
      required this.color,
    });

  FoodModel foodModel;
  Color color;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: apb(foodModel.title, color, context,
            is_it_a_favorite: true,
            foodmodel: foodModel,
          ),
        body: ListView(
          children: [
            Column(
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
                const SizedBox(
                  height: 14,
                ),
                Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: color, fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                for (var x in foodModel.ingredients)
                  Column(
                    children: [
                      Text(
                        x,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 20),
                      ),
                      Divider(
                        thickness: 2,
                        color: color,
                      )
                    ],
                  ),
                Text(
                  "Steps",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: color, fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...foodModel.steps.map(
                  (e) {
                    return Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          e,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ));
  }
}
