import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
import 'package:meals/models/mealModel.dart';
import 'package:transparent_image/transparent_image.dart';

class Detailsscreen extends StatelessWidget {
  Detailsscreen({super.key, required this.m1, required this.f1});

  MealModel m1;
  void Function(MealModel nee) f1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(m1.title),
        actions: [
          IconButton(
              onPressed: () {
                f1(m1);
              },
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
              ))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                m1.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              for (String home in m1.ingredients)
                Text(
                  home,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              for (String e in m1.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
