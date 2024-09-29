import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
import 'package:meals/Widgets/grid_item.dart';
import 'package:meals/data/fake_data.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Pick your category",context),
        body: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [
            ...availableCategories.map(
              (e) {
                return GridItem(c1: e);
              },
            ),
          ],
        ));
  }
}
