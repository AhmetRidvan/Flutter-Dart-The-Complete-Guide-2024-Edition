import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/models/food_model.dart';

class FavoriteFoodNotifier extends StateNotifier<List<FoodModel>> {
  FavoriteFoodNotifier() : super([]); //asdsa

  
}

var favoriteFoodsProvider = StateNotifierProvider();
