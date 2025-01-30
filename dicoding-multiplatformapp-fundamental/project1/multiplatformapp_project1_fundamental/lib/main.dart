import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/add_review_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/detail_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/list_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/search_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/app_bar_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/theme_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/detail/detail_screen.dart';
import 'package:multiplatformapp_project1_fundamental/screen/home/home_screen.dart';
import 'package:multiplatformapp_project1_fundamental/screen/search/search_screen.dart';
import 'package:multiplatformapp_project1_fundamental/static/navigation_route.dart';
import 'package:provider/provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/styles/theme_config.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => AppBarProvider()),
      Provider(
        create: (context) => ApiServices(),
      ),
      ChangeNotifierProvider(
        create: (context) => ListRestaurantProvider(
          context.read<ApiServices>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchRestaurantProvider(
          context.read<ApiServices>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => DetailRestaurantProvider(
          context.read<ApiServices>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => AddReviewProvider(
          context.read<ApiServices>(),
        ),
      ),
    ],
    child: const MainApplication(),
  ));
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 
    return MaterialApp(
      title: 'List Restaurant App',
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const HomeScreen(),
        NavigationRoute.search.name: (context) => const SearchScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
