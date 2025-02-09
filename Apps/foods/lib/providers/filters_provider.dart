import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/providers/foods_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        }); //State'e ilk durmunu veriyoruz

  void setFilters(Map<Filter, bool> asd) {
    state = asd;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

var filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

var filteredFoodsProvier = Provider(
//Watch nerede olduğu farketmeksizin değişiklik olduğunda yeniden yürütür tıpkı setState gibi.
  (ref) {
    final meals = ref.watch(foodProvider);
    final activeFilters = ref.watch(filtersProvider);

    return meals.where(
      (element) {
        if (activeFilters[Filter.lactoseFree]! && !element.isLactoseFree) {
          return false;
        }
        if (activeFilters[Filter.glutenFree]! && !element.isGlutenFree) {
          return false;
        }
        if (activeFilters[Filter.vegetarian]! && !element.isVegetarian) {
          return false;
        }
        if (activeFilters[Filter.vegan]! && !element.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
  },
);







/*
void main() {
  Map<int,String> ogrenciler = {
    1:"Mehmet özerk",
    2:"Şaban aktaş",
    3:"Ahmet şahin",
  } ;
  var ornek = {
    ...ogrenciler,
    3:"Yeni Ahmet şahin",
  };
  print(ornek);
}
{1: Mehmet özerk, 2: Şaban aktaş, 3: Yeni Ahmet şahin}

*/