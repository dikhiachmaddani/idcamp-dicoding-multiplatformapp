import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/list_restaurant_model.dart';

sealed class ListRestaurantResultState {}

class ListRestaurantNoneState extends ListRestaurantResultState {}

class ListRestaurantLoadingState extends ListRestaurantResultState {}

class ListRestaurantErrorState extends ListRestaurantResultState {
  final String error;

  ListRestaurantErrorState(this.error);
}

class ListRestaurantLoadedState extends ListRestaurantResultState {
  final List<ListRestaurantModel> data;
  ListRestaurantLoadedState(this.data);
}
