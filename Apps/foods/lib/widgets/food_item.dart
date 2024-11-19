import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/screens/foods_details_screen.dart';
import 'package:foods/widgets/food_item_meta.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodItem extends StatelessWidget {
  FoodItem(
      {super.key,
      required this.foodModel,
      required this.color,
      required this.toFoodsDetailsScreenFunction});

  FoodModel foodModel;
  Color color;
  Function(FoodModel foodmodel,BuildContext context,Color color) toFoodsDetailsScreenFunction;

  String get ComplexityToUpperCase {
    return foodModel.complexity.name[0].toUpperCase() +
        foodModel.complexity.name.substring(1);
  }

  String get AffordabilityToUpperCase {
    return foodModel.affordability.name[0].toUpperCase() +
        foodModel.affordability.name.substring(1);
  }

  // void toFoodsDetailsScreen(
  //     FoodModel foodmodel, BuildContext context, Color color) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) {
  //       return FoodsDetails(foodModel: foodModel, color: color);
  //     },
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: color,
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          toFoodsDetailsScreenFunction(foodModel,context,color);
        },
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
                  color: color.withOpacity(0.6),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      foodModel.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FoodItemMeta(
                        icon: Icons.access_time_filled_rounded,
                        text: "${foodModel.duration} min"),
                    FoodItemMeta(
                      icon: Icons.workspaces_sharp,
                      text: (ComplexityToUpperCase),
                    ),
                    FoodItemMeta(
                      icon: Icons.diamond,
                      text: (AffordabilityToUpperCase),
                    ),
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
