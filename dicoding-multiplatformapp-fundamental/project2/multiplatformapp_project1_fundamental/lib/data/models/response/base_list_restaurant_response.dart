import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/list_restaurant_model.dart';

class BaseListRestaurantResponse {
  final bool error;
  final String message;
  final int count;
  final List<ListRestaurantModel> restaurants;

  BaseListRestaurantResponse(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory BaseListRestaurantResponse.fromJson(Map<String, dynamic> json) {
    var list = json['restaurants'] as List;
    List<ListRestaurantModel> restaurantList =
        list.map((i) => ListRestaurantModel.fromJson(i)).toList();

    return BaseListRestaurantResponse(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurants: restaurantList,
    );
  }
}
