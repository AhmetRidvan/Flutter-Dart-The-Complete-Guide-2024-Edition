//Amaç tüm favori yemekleri bir favori yemekler listesinde saklayan bir sağlayıcı yapmak
//StateNotifier daima yeni adresleme ile çalışır dolayısıyla atama ile aslana değişiklik yapmayız atama yaparız

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/models/food_model.dart';

class FavoriteFoodStateNotifier extends StateNotifier<List<FoodModel>> {
  FavoriteFoodStateNotifier() : super([]);

  ChangeFavoriteFood(FoodModel f1) {
    final dogrumu = state.contains(f1);

    if (dogrumu) {
      state = state.where(
        (element) {
          return element.id != f1.id;
        },
      ).toList();
    } else {
      state = [...state, f1];
    }
  }
}

final FavoriteFoodStateNotifierProvider =
    StateNotifierProvider<FavoriteFoodStateNotifier, List<FoodModel>>(
  (ref) {
    return FavoriteFoodStateNotifier();
  },
);
