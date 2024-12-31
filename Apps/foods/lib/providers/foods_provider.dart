import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/data/data.dart';

var foodProvider = Provider(
  (dref) {
    return FoodsList;
  },
);
