import 'package:multiplatformapp_project1_fundamental/data/models/menu/drink_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/menu/food_model.dart';

class MenuModel {
  final List<FoodModel> foods;
  final List<DrinkModel> drinks;

  MenuModel({
    required this.foods,
    required this.drinks,
  });
}
