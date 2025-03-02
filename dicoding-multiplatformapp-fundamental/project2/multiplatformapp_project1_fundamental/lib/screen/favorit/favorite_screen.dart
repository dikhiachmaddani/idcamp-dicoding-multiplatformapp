import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/favorite/local_database_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/favorit/widget/favorite_card_widget.dart';
import 'package:multiplatformapp_project1_fundamental/static/navigation_route.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    if (!mounted) return;
    final provider = context.read<LocalDatabaseProvider>();
    await provider.loadAllFavoriteValue();
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Consumer<LocalDatabaseProvider>(
        builder: (context, value, child) {
          final restaurantList = value.restaurantList ?? [];
          return switch (restaurantList.isNotEmpty) {
            true => ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  final favorite = restaurantList[index];

                  return FavoriteCardWidget(
                    listFavoriteRestaurant: favorite,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        arguments: favorite.id,
                      );
                    },
                  );
                },
              ),
            _ => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Bookmarked"),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
