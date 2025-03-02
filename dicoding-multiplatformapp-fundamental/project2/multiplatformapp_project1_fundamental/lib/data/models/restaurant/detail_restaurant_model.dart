import 'package:multiplatformapp_project1_fundamental/data/models/categories/categories_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/customer-reviews/customer_review_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/menu/drink_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/menu/food_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/menu/menu_model.dart';

class DetailRestaurantModel {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String address;
  final double rating;
  final List<CategoriesModel> categories;
  final MenuModel menus;
  final List<CustomerReviewModel> customerReviews;

  DetailRestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.address,
    required this.rating,
    required this.categories,
    required this.customerReviews,
    required this.menus,
  });

  factory DetailRestaurantModel.fromJson(Map<String, dynamic> json) {
    var categoryList = json['categories'] as List;
    var menuFoodsList = json['menus']['foods'] as List;
    var menuDrinksList = json['menus']['drinks'] as List;
    var reviewList = json['customerReviews'] as List;

    return DetailRestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      address: json['address'],
      pictureId: json['pictureId'],
      categories: categoryList.map((i) => CategoriesModel.fromJson(i)).toList(),
      menus: MenuModel(
        foods: menuFoodsList.map((i) => FoodModel.fromJson(i)).toList(),
        drinks: menuDrinksList.map((i) => DrinkModel.fromJson(i)).toList(),
      ),
      rating: json['rating'].toDouble(),
      customerReviews:
          reviewList.map((i) => CustomerReviewModel.fromJson(i)).toList(),
    );
  }
}
