import 'package:flutter/material.dart';
import 'package:shopping_list/model/category_model.dart';

var categoriesMap = {
  CategoriesEnum.vegetables: CategoryModel(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  CategoriesEnum.fruit: CategoryModel(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  CategoriesEnum.meat: CategoryModel(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  CategoriesEnum.dairy: CategoryModel(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  CategoriesEnum.carbs: CategoryModel(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  CategoriesEnum.sweets: CategoryModel(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  CategoriesEnum.spices: CategoryModel(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  CategoriesEnum.convenience: CategoryModel(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  CategoriesEnum.hygiene: CategoryModel(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  CategoriesEnum.other: CategoryModel(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};

enum CategoriesEnum {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}