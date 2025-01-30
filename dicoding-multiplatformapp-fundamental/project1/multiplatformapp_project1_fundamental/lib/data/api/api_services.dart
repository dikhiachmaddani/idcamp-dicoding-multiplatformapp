import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multiplatformapp_project1_fundamental/data/models/response/base_customer_review_response.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/response/base_detail_restaurant_response.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/response/base_list_restaurant_response.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/response/base_search_restaurant_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<BaseListRestaurantResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return BaseListRestaurantResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<BaseDetailRestaurantResponse> getDetailRestaurant(String restaurantId) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$restaurantId"));

    if (response.statusCode == 200) {
      return BaseDetailRestaurantResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

   Future<BaseCustomerReviewResponse> addReview(String id, String name, String review) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/review"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id,
        "name": name,
        "review": review,
      }),
    );

    if (response.statusCode == 201) {
      return BaseCustomerReviewResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post review');
    }
  }

  Future<BaseSearchRestaurantResponse> searchRestaurant(String search) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$search"));

    if (response.statusCode == 200) {
      return BaseSearchRestaurantResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load search restaurant');
    }
  }
}