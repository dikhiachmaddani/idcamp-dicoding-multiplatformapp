import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/workmanager_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:multiplatformapp_project1_fundamental/screen/setting/setting_screen.dart';

import 'package:multiplatformapp_project1_fundamental/data/local/http_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/local_database_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/local_notification_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/shared_preferences_service.dart';

import 'package:multiplatformapp_project1_fundamental/data/provider/detail/add_review_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/detail_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/favorite_icon_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/favorite/local_database_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/list_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/search_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/main/index_nav_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/notification/local_notification_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/theme_provider.dart';

import 'package:multiplatformapp_project1_fundamental/screen/detail/detail_screen.dart';
import 'package:multiplatformapp_project1_fundamental/screen/main/main_screen.dart';
import 'package:multiplatformapp_project1_fundamental/screen/search/search_screen.dart';

import 'package:multiplatformapp_project1_fundamental/static/navigation_route.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/styles/theme_config.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String route = NavigationRoute.mainRoute.name;
  runApp(MyApp(prefs: prefs, initialRoute: route));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final String initialRoute;

  const MyApp({super.key, required this.prefs, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => SharedPreferencesService(prefs)),
        Provider(
          create: (context) =>
              WorkmanagerService(context.read<SharedPreferencesService>())
                ..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            context.read<SharedPreferencesService>(),
          ),
        ),
        Provider(create: (_) => LocalDatabaseService()),
        ChangeNotifierProvider(
          create: (context) => LocalDatabaseProvider(
            context.read<LocalDatabaseService>(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteIconProvider()),
        Provider(create: (_) => ApiServices(client: Client())),
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
        ChangeNotifierProvider(create: (_) => IndexNavProvider()),
        Provider(create: (_) => HttpService()),
        Provider(
            create: (context) => LocalNotificationService(
                context.read<SharedPreferencesService>())
              ..init()
              ..configureLocalTimeZone()),
        ChangeNotifierProvider(
          create: (context) => LocalNotificationProvider(
            context.read<LocalNotificationService>(),
            context.read<SharedPreferencesService>(),
          )..requestPermissions(),
        ),
      ],
      child: MainApplication(initialRoute: initialRoute),
    );
  }
}

class MainApplication extends StatelessWidget {
  final String initialRoute;

  const MainApplication({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'List Restaurant App',
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: initialRoute,
          routes: {
            NavigationRoute.mainRoute.name: (_) => const MainScreen(),
            NavigationRoute.search.name: (_) => const SearchScreen(),
            NavigationRoute.setting.name: (_) => const SettingScreen(),
            NavigationRoute.detailRoute.name: (context) {
              final args = ModalRoute.of(context)?.settings.arguments;
              return DetailScreen(restaurantId: args as String? ?? '');
            },
          },
        );
      },
    );
  }
}
