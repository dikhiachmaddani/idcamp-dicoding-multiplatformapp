import 'package:multiplatformapp_project1_fundamental/data/models/customer-reviews/customer_review_model.dart';

class BaseCustomerReviewResponse {
  final bool error;
  final String message;
  final List<CustomerReviewModel> customerReviews;

  BaseCustomerReviewResponse({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory BaseCustomerReviewResponse.fromJson(Map<String, dynamic> json) {
    var list = json['customerReviews'] as List;
    List<CustomerReviewModel> customerReviews =
        list.map((i) => CustomerReviewModel.fromJson(i)).toList();

    return BaseCustomerReviewResponse(
      error: json["error"],
      message: json["message"],
      customerReviews: customerReviews,
    );
  }
}
