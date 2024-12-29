//Amaç tüm favori yemekleri bir favori yemekler listesinde saklayan bir sağlayıcı yapmak
//StateNotifier daima yeni adresleme ile çalışır dolayısıyla atama ile

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/models/food_model.dart';

class FavoriteFoodProvider extends StateNotifier<List<FoodModel>> {
  FavoriteFoodProvider() : super([]);

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
