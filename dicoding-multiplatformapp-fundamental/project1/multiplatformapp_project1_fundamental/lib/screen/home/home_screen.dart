import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/list_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/theme_provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your Location",
                                  style: Theme.of(context).textTheme.bodySmall),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.pin_drop,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("Blok M, Jakarta Selatan",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              )
                            ],
                          )),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              color: Theme.of(context).colorScheme.secondary,
                              icon: Icon(
                                themeProvider.themeMode == ThemeMode.dark
                                    ? Icons.light_mode
                                    : Icons.nights_stay,
                                size: 15,
                              ),
                              onPressed: () {
                                themeProvider.toggleTheme();
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              color: Theme.of(context).colorScheme.secondary,
                              icon: const Icon(Icons.search, size: 15),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  NavigationRoute.search.name,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ListRestaurantProvider>(
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
          ),
        ],
      ),
    );
  }
}
