import 'package:flutter/widgets.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/static/detail_restaurant_result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  DetailRestaurantProvider(
    this._apiServices,
  );

  DetailRestaurantResultState _resultState = DetailRestaurantNoneState();
  DetailRestaurantResultState get resultState => _resultState;

  Future<void> fetchDetailRestaurant(String restaurantId) async {
    try {
      _resultState = DetailRestaurantLoadingState();
      notifyListeners();

      final result = await _apiServices.getDetailRestaurant(restaurantId);

      if (result.error) {
        _resultState = DetailRestaurantErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = DetailRestaurantLoadedState(result.restaurant);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = DetailRestaurantErrorState(e.toString());
      notifyListeners();
    }
  }
}
