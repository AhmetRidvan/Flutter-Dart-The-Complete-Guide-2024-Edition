import 'package:shopping_list/data/categories_data.dart';
import 'package:shopping_list/model/grocery_item_model.dart';

var groceryItemsList = [
  GroceryItemModel(
      id: "a",
      name: "Milk",
      quantity: 1,
      category: categoriesMap[CategoriesEnum.dairy]!),
  GroceryItemModel(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categoriesMap[CategoriesEnum.fruit]!),
  GroceryItemModel(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categoriesMap[CategoriesEnum.meat]!),
];