import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/detail_restaurant_model.dart';

sealed class DetailRestaurantResultState {}

class DetailRestaurantNoneState extends DetailRestaurantResultState {}

class DetailRestaurantLoadingState extends DetailRestaurantResultState {}

class DetailRestaurantErrorState extends DetailRestaurantResultState {
  final String error;

  DetailRestaurantErrorState(this.error);
}

class DetailRestaurantLoadedState extends DetailRestaurantResultState {
  final DetailRestaurantModel data;
  DetailRestaurantLoadedState(this.data);
}
