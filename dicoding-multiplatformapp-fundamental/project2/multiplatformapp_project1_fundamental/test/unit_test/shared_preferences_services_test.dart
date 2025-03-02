import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/received-notification/is_enable_notification_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/theme/is_dark_theme_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('SharedPreferencesService', () {
    late MockSharedPreferences mockPreferences;
    late SharedPreferencesService sharedPreferencesService;

    setUp(() {
      mockPreferences = MockSharedPreferences();
      sharedPreferencesService = SharedPreferencesService(mockPreferences);
    });

    test('saves and retrieves dark theme value correctly', () async {
      const key = SharedPreferencesService.keyisDarkTheme;
      final themeModel = IsDarkThemeModel(themeMode: true);

      when(() => mockPreferences.setBool(key, themeModel.themeMode))
          .thenAnswer((_) async => true);
      when(() => mockPreferences.getBool(key)).thenReturn(themeModel.themeMode);

      await sharedPreferencesService.saveIsDarkThemeValue(themeModel);
      final result = sharedPreferencesService.getIsDarkThemeValue();

      expect(result.themeMode, themeModel.themeMode);
    });

    test('saves and retrieves notification value correctly', () async {
      const key = SharedPreferencesService.keyisEnableNotif;
      final notifModel = IsEnableNotificationModel(notification: true);

      when(() => mockPreferences.setBool(key, notifModel.notification))
          .thenAnswer((_) async => true);
      when(() => mockPreferences.getBool(key))
          .thenReturn(notifModel.notification);

      await sharedPreferencesService.saveIsEnableNotificationValue(notifModel);
      final result = sharedPreferencesService.getIsEnableNotificationValue();

      expect(result, notifModel.notification);
    });
  });
}
