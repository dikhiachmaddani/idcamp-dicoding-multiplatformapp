import 'dart:async';
import 'dart:math';

import 'package:http/http.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/local_notification_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/shared_preferences_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/response/base_list_restaurant_response.dart';
import 'package:multiplatformapp_project1_fundamental/static/my_workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == MyWorkmanager.periodic.taskName) {
      final Client client = Client();
      final apiService = ApiServices(client: client);
      final prefs = await SharedPreferences.getInstance();

      final SharedPreferencesService sharedPreferencesService =
          SharedPreferencesService(prefs);
      final LocalNotificationService localNotificationService =
          LocalNotificationService(sharedPreferencesService);
      final BaseListRestaurantResponse restaurantResponse =
          await apiService.getRestaurantList();

      int randomNumber = Random().nextInt(
        restaurantResponse.restaurants.length,
      );
      final restaurant = restaurantResponse.restaurants[randomNumber];
      await localNotificationService.showNotification(
        "Rekomendasi Hari Ini 🍽",
        "${restaurant.name} - ${restaurant.city} ⭐ ${restaurant.rating}",
      );
    }
    return Future.value(true);
  });
}

class WorkmanagerService {
  final Workmanager _workmanager;
  final SharedPreferencesService sharedPreferencesService;

  WorkmanagerService(this.sharedPreferencesService, [Workmanager? workmanager])
      : _workmanager = workmanager ??= Workmanager();

  Future<void> init() async {
    await _workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  }

  Future<void> runPeriodicTask() async {
    final now = DateTime.now();
    final targetTime = DateTime(now.year, now.month, now.day, 11, 0);
    final initialDelay = now.isBefore(targetTime)
        ? targetTime.difference(now)
        : targetTime.add(const Duration(days: 1)).difference(now);

    await _workmanager.registerPeriodicTask(
      MyWorkmanager.periodic.uniqueName,
      MyWorkmanager.periodic.taskName,
      frequency: const Duration(hours: 24),
      initialDelay: initialDelay,
      inputData: {
        "data": "This is a valid payload from periodic task workmanager",
      },
    );
  }

  Future<void> cancelAllTask() async {
    await _workmanager.cancelAll();
  }

  Future<void> toggleWorkManager() async {
    final isEnabled = sharedPreferencesService.getIsEnableNotificationValue();
    if (!isEnabled) {
      await runPeriodicTask();
    } else {
      await cancelAllTask();
    }
  }
}
