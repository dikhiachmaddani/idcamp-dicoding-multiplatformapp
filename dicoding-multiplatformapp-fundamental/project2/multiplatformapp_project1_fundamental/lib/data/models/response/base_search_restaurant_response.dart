import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/list_restaurant_model.dart';

class BaseSearchRestaurantResponse {
  final bool error;
  final int founded;
  final List<ListRestaurantModel> restaurants;

  BaseSearchRestaurantResponse(
      {required this.error, required this.founded, required this.restaurants});

  factory BaseSearchRestaurantResponse.fromJson(Map<String, dynamic> json) {
    return BaseSearchRestaurantResponse(
      error: json["error"],
      founded: json["founded"],
      restaurants: json["restaurants"] != null
          ? List<ListRestaurantModel>.from(
              json["restaurants"]!.map((x) => ListRestaurantModel.fromJson(x)))
          : <ListRestaurantModel>[],
    );
  }
}
