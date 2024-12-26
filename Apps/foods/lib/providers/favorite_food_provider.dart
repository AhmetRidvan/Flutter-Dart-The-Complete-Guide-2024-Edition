import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/models/food_model.dart';

class FavoriteFoodProvider extends StateNotifier<List<FoodModel>> {
  FavoriteFoodProvider(super.key);
}

var favoriteFoodsProvider = StateNotifierProvider();
