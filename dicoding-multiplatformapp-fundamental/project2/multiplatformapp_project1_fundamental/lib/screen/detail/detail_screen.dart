import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/detail_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/detail/widget/review_modal_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:multiplatformapp_project1_fundamental/static/detail_restaurant_result_state.dart';
import 'package:multiplatformapp_project1_fundamental/screen/detail/widget/body_detail.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    if (!mounted) return;
    final provider = context.read<DetailRestaurantProvider>();
    await provider.fetchDetailRestaurant(widget.restaurantId);
    if (!mounted) return;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      floatingActionButton: SizedBox(
        height: 45,
        child: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ReviewModalFormWidget(
                id: widget.restaurantId,
              ),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Review'),
        ),
      ),
      body: Stack(
        children: [
          Consumer<DetailRestaurantProvider>(
            builder: (context, value, child) {
              return switch (value.resultState) {
                DetailRestaurantLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                DetailRestaurantLoadedState(data: var restaurant) =>
                  SingleChildScrollView(
                    child: BodyDetail(restaurant: restaurant),
                  ),
                DetailRestaurantErrorState() => const Center(
                    child: Text(
                        "Mohon Maaf, Server gagal untuk memuat data restoran. Mohon untuk cek ulang jaringan internet anda",
                        textAlign: TextAlign.center),
                  ),
                _ => const SizedBox(),
              };
            },
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.transparent,
                child: AppBar(
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(Icons.arrow_back, size: 25),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
