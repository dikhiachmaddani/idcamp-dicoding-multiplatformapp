import 'package:multiplatformapp_project1_fundamental/data/models/customer-reviews/customer_review_model.dart';

abstract class AddReviewResultState {}

class AddReviewNoneState extends AddReviewResultState {}

class AddReviewLoadingState extends AddReviewResultState {}

class AddReviewSuccessState extends AddReviewResultState {
  final List<CustomerReviewModel> customerReviews;
  AddReviewSuccessState(this.customerReviews);
}

class AddReviewErrorState extends AddReviewResultState {
  final String message;
  AddReviewErrorState(this.message);
}
