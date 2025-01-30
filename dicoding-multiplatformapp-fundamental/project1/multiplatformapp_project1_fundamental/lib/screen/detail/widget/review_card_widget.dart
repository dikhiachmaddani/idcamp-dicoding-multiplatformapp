import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/customer-reviews/customer_review_model.dart';

class ReviewCardWidget extends StatefulWidget {
  final CustomerReviewModel customerReviews;

  const ReviewCardWidget({
    super.key,
    required this.customerReviews,
  });

  @override
  ReviewCardWidgetState createState() => ReviewCardWidgetState();
}

class ReviewCardWidgetState extends State<ReviewCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.supervised_user_circle, size: 35),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.customerReviews.date,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  widget.customerReviews.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  widget.customerReviews.review,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
