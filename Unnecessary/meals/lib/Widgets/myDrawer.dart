import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  Mydrawer({super.key, required this.merhaba});

  Function(String selam) merhaba;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.onSurface,
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Cooking up",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              merhaba("m");
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onSurface,
              size: 27,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              merhaba("f");
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
              size: 27,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
