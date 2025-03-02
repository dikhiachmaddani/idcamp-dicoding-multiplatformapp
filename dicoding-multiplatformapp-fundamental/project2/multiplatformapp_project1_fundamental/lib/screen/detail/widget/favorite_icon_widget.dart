import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/restaurant_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/favorite_icon_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/favorite/local_database_provider.dart';
import 'package:provider/provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  final RestaurantModel restaurant;

  const FavoriteIconWidget({
    super.key,
    required this.restaurant,
  });

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  void initState() {
    super.initState();

    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() async {
      await localDatabaseProvider.loadFavoriteValueById(widget.restaurant.id);
      final value = localDatabaseProvider.restaurant == null
          ? false
          : localDatabaseProvider.restaurant!.id == widget.restaurant.id;
      favoriteIconProvider.isFavorited = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: () async {
          final localDatabaseProvider = context.read<LocalDatabaseProvider>();
          final favoriteIconProvider = context.read<FavoriteIconProvider>();
          final isFavorited = favoriteIconProvider.isFavorited;

          if (isFavorited) {
            await localDatabaseProvider
                .removeFavoriteValueById(widget.restaurant.id);
          } else {
            await localDatabaseProvider.saveFavoriteValue(widget.restaurant);
          }
          favoriteIconProvider.isFavorited = !isFavorited;
          localDatabaseProvider.loadAllFavoriteValue();
        },
        icon: Icon(
          Icons.thumb_up,
          size: 25,
          color: context.watch<FavoriteIconProvider>().isFavorited
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
