import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/list_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/home/widget/home_card_widget.dart';
import 'package:multiplatformapp_project1_fundamental/static/navigation_route.dart';
import 'package:provider/provider.dart';
import 'package:multiplatformapp_project1_fundamental/static/list_restaurant_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    if (!mounted) return;
    final provider = context.read<ListRestaurantProvider>();
    await provider.fetchListRestaurant();
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Consumer<ListRestaurantProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            ListRestaurantLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            ListRestaurantLoadedState(data: var listRestaurantList) =>
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: listRestaurantList.length,
                itemBuilder: (context, index) {
                  final listRestaurant = listRestaurantList[index];
                  return HomeCardWidget(
                    listRestaurant: listRestaurant,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        arguments: listRestaurant.id,
                      );
                    },
                  );
                },
              ),
            ListRestaurantErrorState() => const Center(
                child: Text(
                    "Mohon Maaf, Server gagal untuk memuat data restoran. Mohon untuk cek ulang jaringan internet anda",
                    textAlign: TextAlign.center),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
