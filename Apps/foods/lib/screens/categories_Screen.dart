import 'package:flutter/material.dart';
import 'package:foods/data/data.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/gridView_Item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: GridView.builder(
        itemCount: CategoriesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemBuilder: (context, index) {
          return GridViewItem(categoryModel: CategoriesList[index]);
        },
      ),
      appBar: apb(
        "Pick your category",
        Theme.of(context).colorScheme.primary,
        context
      ),
    );
  }
}
