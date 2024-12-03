import 'package:flutter/material.dart';

class Dra_wer extends StatelessWidget {
  Dra_wer({super.key, required this.textFunction});

  Function(String text) textFunction;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shadowColor: Colors.lightBlue,
      width: 350,
      elevation: 333,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.onPrimaryContainer
            ])),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  color: Theme.of(context).colorScheme.onPrimary,
                  Icons.fastfood,
                  size: 50,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Foods",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 30),
            ),
            onTap: () {
              textFunction("Foods");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 30),
            ),
            onTap: () {
              textFunction("Filters");
            },
          )
        ],
      ),
    );
  }
}
