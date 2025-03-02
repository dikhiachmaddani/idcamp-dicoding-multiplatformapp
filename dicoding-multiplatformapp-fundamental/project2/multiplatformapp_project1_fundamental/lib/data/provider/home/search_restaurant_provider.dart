import 'package:flutter/widgets.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/static/search_restaurant_result_state.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  SearchRestaurantProvider(
    this._apiServices,
  );

  SearchRestaurantResultState _resultState = SearchRestaurantNoneState();
  SearchRestaurantResultState get resultState => _resultState;

  Future<void> fetchSeachRestaurant(String search) async {
    try {
      _resultState = SearchRestaurantLoadingState();
      notifyListeners();

      final result = await _apiServices.searchRestaurant(search);

      if (result.error) {
        if (result.founded == 0) {
          _resultState =
              SearchRestaurantErrorState("restoran tidak ditemukan.");
          notifyListeners();
        }
      } else {
        _resultState = SearchRestaurantLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = SearchRestaurantErrorState(e.toString());
      notifyListeners();
    }
  }
}
