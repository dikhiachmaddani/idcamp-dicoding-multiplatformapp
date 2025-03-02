import 'package:flutter/widgets.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/static/add_review_state.dart';

class AddReviewProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  AddReviewProvider(
    this._apiServices,
  );

  AddReviewResultState _resultState = AddReviewNoneState();
  AddReviewResultState get resultState => _resultState;

  Future<void> addReview(String id, String name, String review) async {
    try {
      _resultState = AddReviewLoadingState();
      notifyListeners();

      final result = await _apiServices.addReview(id, name, review);

      if (result.error) {
        _resultState = AddReviewErrorState(result.message);
      } else {
        _resultState = AddReviewSuccessState(result.customerReviews);
      }
      notifyListeners();
    } on Exception catch (e) {
      _resultState = AddReviewErrorState(e.toString());
      notifyListeners();
    }
  }
}
