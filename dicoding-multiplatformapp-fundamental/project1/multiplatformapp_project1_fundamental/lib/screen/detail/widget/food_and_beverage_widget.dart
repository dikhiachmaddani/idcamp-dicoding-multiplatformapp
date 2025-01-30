import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/detail_restaurant_model.dart';

class FoodAndBeverageWidget extends StatelessWidget {
  const FoodAndBeverageWidget({
    super.key,
    required this.restaurant,
    required this.type,
  });

  final DetailRestaurantModel restaurant;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: type == 'foods'
                ? restaurant.menus.foods.length
                : type == 'drinks'
                    ? restaurant.menus.drinks.length
                    : [].length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 20),
                width: 125,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.food_bank_outlined,
                      size: 50,
                    ),
                    Text(
                      type == 'foods'
                          ? restaurant.menus.foods[index].name
                          : type == 'drinks'
                              ? restaurant.menus.drinks[index].name
                              : '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 0),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
