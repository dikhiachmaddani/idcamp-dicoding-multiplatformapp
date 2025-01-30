import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/detail_restaurant_model.dart';
import 'package:multiplatformapp_project1_fundamental/screen/detail/widget/food_and_beverage_widget.dart';
import 'package:multiplatformapp_project1_fundamental/screen/detail/widget/review_card_widget.dart';
import 'package:multiplatformapp_project1_fundamental/screen/detail/widget/tagline_widget.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({
    super.key,
    required this.restaurant,
  });

  final DetailRestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    String detailLocation = "${restaurant.address}, ${restaurant.city}";
    return SingleChildScrollView(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 250,
              minHeight: 250,
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            child: Hero(
              tag: restaurant.pictureId,
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    TaglineWidget(
                      icon: Icons.pin_drop,
                      tagName: detailLocation,
                    ),
                    TaglineWidget(
                      icon: Icons.star,
                      tagName: restaurant.rating.toString(),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Text(
                restaurant.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Makanan",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          FoodAndBeverageWidget(
            restaurant: restaurant,
            type: 'foods',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Minuman",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          FoodAndBeverageWidget(
            restaurant: restaurant,
            type: 'drinks',
          ),
          const SizedBox(height: 29),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Review",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 29),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurant.customerReviews.length,
              itemBuilder: (context, index) {
                final customerReviews = restaurant.customerReviews[index];
                return ReviewCardWidget(customerReviews: customerReviews);
              },
            ),
          ),
        ],
      ),
    );
  }
}
