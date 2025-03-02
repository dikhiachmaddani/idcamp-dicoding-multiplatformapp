import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/local_notification_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/shared_preferences_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/received-notification/is_enable_notification_model.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;
  final SharedPreferencesService sharedPreferencesService;

  LocalNotificationProvider(
      this.flutterNotificationService, this.sharedPreferencesService) {
    _loadNotification();
  }
  final _notificationId = 0;

  bool? _permission = false;
  bool? get permission => _permission;

  bool _isNotificationEnabled = false;
  bool get isNotificationEnabled => _isNotificationEnabled;

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  Future<void> requestPermissions() async {
    _permission = await flutterNotificationService.requestPermissions();
    notifyListeners();
  }

  Future<void> cancelNotification(int id) async {
    await flutterNotificationService.cancelNotification(id);
  }

  void _loadNotification() {
    _isNotificationEnabled =
        sharedPreferencesService.getIsEnableNotificationValue();
    notifyListeners();
  }

  Future<void> toggleNotification() async {
    _isNotificationEnabled = !_isNotificationEnabled;
    await sharedPreferencesService.saveIsEnableNotificationValue(
        IsEnableNotificationModel(notification: _isNotificationEnabled));

    flutterNotificationService.toggleNotification(
      id: _notificationId,
    );

    notifyListeners();
  }
}
