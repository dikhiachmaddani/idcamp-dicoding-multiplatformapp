import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/search_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/theme_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/search/widget/search_card_widget.dart';
import 'package:multiplatformapp_project1_fundamental/static/navigation_route.dart';
import 'package:provider/provider.dart';
import 'package:multiplatformapp_project1_fundamental/static/search_restaurant_result_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    if (!mounted) return;
    final provider = context.read<SearchRestaurantProvider>();
    await provider.fetchSeachRestaurant('');
    if (!mounted) return;
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      context.read<SearchRestaurantProvider>().fetchSeachRestaurant(query);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Masukkan kata kunci untuk mencari restoran')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        titleSpacing: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Location", style: Theme.of(context).textTheme.bodySmall),
            Row(
              children: [
                const Icon(Icons.pin_drop, size: 15),
                const SizedBox(width: 3),
                Text("Blok M, Jakarta Selatan",
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(100)),
                  child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) {
                    return IconButton(
                      color: Theme.of(context).colorScheme.secondary,
                      icon: Icon(
                        themeProvider.themeMode == ThemeMode.light
                            ? Icons.light_mode
                            : Icons.nights_stay,
                        size: 15,
                      ),
                      onPressed: themeProvider.toggleTheme,
                    );
                  })),
              const SizedBox(width: 15),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 35,
            margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
            child: TextField(
              style: Theme.of(context).textTheme.bodySmall,
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                contentPadding: EdgeInsets.zero,
                hintText: 'Payakumbuah, Bebek Carok...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, size: 13),
                  onPressed: () async {
                    await context
                        .read<SearchRestaurantProvider>()
                        .fetchSeachRestaurant("");
                    _searchController.clear();
                  },
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, size: 20),
                  onPressed: _performSearch,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (_) => _performSearch(),
            ),
          ),
          Expanded(
            child: Consumer<SearchRestaurantProvider>(
              builder: (context, value, child) {
                switch (value.resultState) {
                  case SearchRestaurantLoadingState():
                    return const Center(child: CircularProgressIndicator());
                  case SearchRestaurantLoadedState(
                      data: var listRestaurantList
                    ):
                    if (listRestaurantList.isEmpty) {
                      return const Center(
                          child: Text('Tidak ada restoran ditemukan.'));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: listRestaurantList.length,
                      itemBuilder: (context, index) {
                        final restaurant = listRestaurantList[index];
                        return SearchCardWidget(
                          listRestaurant: restaurant,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              NavigationRoute.detailRoute.name,
                              arguments: restaurant.id,
                            );
                          },
                        );
                      },
                    );
                  case SearchRestaurantErrorState():
                    return const Center(
                      child: Text(
                          "Gagal memuat data restoran. Periksa koneksi internet Anda."),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
