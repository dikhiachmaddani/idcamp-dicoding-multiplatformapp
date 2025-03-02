import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/main/index_nav_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/theme_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/favorit/favorite_screen.dart';
import 'package:multiplatformapp_project1_fundamental/screen/home/home_screen.dart';
import 'package:multiplatformapp_project1_fundamental/static/navigation_route.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
        actions: [
          Consumer<IndexNavProvider>(
            builder: (context, value, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.secondary,
                      icon: const Icon(Icons.settings, size: 15),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          NavigationRoute.setting.name,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icon(
                            themeProvider.themeMode == ThemeMode.light
                                ? Icons.light_mode
                                : Icons.nights_stay,
                            size: 15,
                          ),
                          onPressed: themeProvider.toggleTheme,
                        ),
                      );
                    },
                  ),
                  if (value.indexBottomNavBar != 1) const SizedBox(width: 10),
                  if (value.indexBottomNavBar != 1)
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
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
                  const SizedBox(width: 20),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          switch (value.indexBottomNavBar) {
            case 0:
              return const HomeScreen();
            default:
              return const FavoriteScreen();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNavBar = index;
        },
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: "Favorites",
            tooltip: "Favorites",
          ),
        ],
      ),
    );
  }
}
