import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/list_restaurant_model.dart';

sealed class SearchRestaurantResultState {}

class SearchRestaurantNoneState extends SearchRestaurantResultState {}

class SearchRestaurantLoadingState extends SearchRestaurantResultState {}

class SearchRestaurantErrorState extends SearchRestaurantResultState {
  final String error;

  SearchRestaurantErrorState(this.error);
}

class SearchRestaurantLoadedState extends SearchRestaurantResultState {
  final List<ListRestaurantModel> data;
  SearchRestaurantLoadedState(this.data);
}
