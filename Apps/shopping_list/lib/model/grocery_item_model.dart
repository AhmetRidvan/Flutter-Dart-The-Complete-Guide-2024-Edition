import 'package:shopping_list/model/category_model.dart';

class GroceryItemModel {
  String id;
  String name;
  int quantity;
  CategoryModel category;

  GroceryItemModel(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category});
}
