import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/providers/filters_provider.dart';
import 'package:foods/screens/bottom_navigation_bar_screen.dart';
import 'package:foods/widgets/SwitchListTileWidget.dart';
import 'package:foods/widgets/app_bar.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: apb("Filters", Theme.of(context).colorScheme.onPrimary, context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: const Text("glutenFree"),
              onChanged: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, value);
              },
              value: activeFilters[Filter.glutenFree]!,
            ),
            SwitchListTile(
              title: const Text("lactoseFree"),
              onChanged: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, value);
              },
              value: activeFilters[Filter.lactoseFree]!,
            ),
            SwitchListTile(
              title: const Text("vegetarian"),
              onChanged: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, value);
              },
              value: activeFilters[Filter.vegetarian]!,
            ),
            SwitchListTile(
              title: const Text("vegan"),
              onChanged: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, value);
              },
              value: activeFilters[Filter.vegan]!,
            ),
          ],
        ),
      ),
    );
  }
}
