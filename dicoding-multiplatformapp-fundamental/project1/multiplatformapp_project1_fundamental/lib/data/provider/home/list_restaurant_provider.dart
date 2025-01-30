import 'package:flutter/widgets.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/static/list_restaurant_result_state.dart';

class ListRestaurantProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  ListRestaurantProvider(
    this._apiServices,
  );

  ListRestaurantResultState _resultState = ListRestaurantNoneState();
  ListRestaurantResultState get resultState => _resultState;

  Future<void> fetchListRestaurant() async {
    try {
      _resultState = ListRestaurantLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurantList();

      if (result.error) {
        _resultState = ListRestaurantErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = ListRestaurantLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = ListRestaurantErrorState(e.toString());
      notifyListeners();
    }
  }
}
