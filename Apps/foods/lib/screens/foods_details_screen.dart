import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/providers/favorite_food_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodsDetailsScreen extends ConsumerWidget {
  FoodsDetailsScreen({
    super.key,
    required this.foodModel,
    required this.color,
  });

  FoodModel foodModel;
  Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favoriteFoods = ref.watch(FavoriteFoodStateNotifierProvider);
    final isFavorite = favoriteFoods.contains(foodModel);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(
            foodModel.title,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final wasAdded = ref
                      .read(FavoriteFoodStateNotifierProvider
                          .notifier) //notifier provider üzerinden sınıfa gitmeni sağlıyor
                      .ChangeFavoriteFood(foodModel);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        wasAdded
                            ? "Food is added as a favorite"
                            : "Food removed",
                      ),
                    ),
                  );
                },
                icon: Icon(isFavorite ? Icons.stars : Icons.star_border))
          ],
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