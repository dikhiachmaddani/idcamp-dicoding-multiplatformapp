import 'package:multiplatformapp_project1_fundamental/data/models/received-notification/is_enable_notification_model.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/theme/is_dark_theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);
  static const String keyisDarkTheme = "MYISDARKTHEME";
  static const String keyisEnableNotif = "MYISENABLENOTIF";

  Future<void> saveIsDarkThemeValue(IsDarkThemeModel themeModel) async {
    try {
      await _preferences.setBool(keyisDarkTheme, themeModel.themeMode);
    } catch (e) {
      throw Exception("Shared preferences cannot save the theme value.");
    }
  }

  IsDarkThemeModel getIsDarkThemeValue() {
    return IsDarkThemeModel(
      themeMode: _preferences.getBool(keyisDarkTheme) ?? false,
    );
  }

  Future<void> saveIsEnableNotificationValue(
      IsEnableNotificationModel isEnableNotificationModel) async {
    try {
      await _preferences.setBool(
          keyisEnableNotif, isEnableNotificationModel.notification);
    } catch (e) {
      throw Exception("Shared preferences cannot save the notification value.");
    }
  }

  bool getIsEnableNotificationValue() {
    return _preferences.getBool(keyisEnableNotif) ?? false;
  }
}
