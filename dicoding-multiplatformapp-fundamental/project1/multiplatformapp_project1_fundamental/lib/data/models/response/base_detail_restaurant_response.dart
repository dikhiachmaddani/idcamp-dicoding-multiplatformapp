import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/detail_restaurant_model.dart';

class BaseDetailRestaurantResponse {
  final bool error;
  final String message;
  final DetailRestaurantModel restaurant;

  BaseDetailRestaurantResponse(
      {required this.error, required this.message, required this.restaurant});

  factory BaseDetailRestaurantResponse.fromJson(Map<String, dynamic> json) {
    return BaseDetailRestaurantResponse(
      error: json["error"],
      message: json["message"],
      restaurant: DetailRestaurantModel.fromJson(json["restaurant"]),
    );
  }
}
