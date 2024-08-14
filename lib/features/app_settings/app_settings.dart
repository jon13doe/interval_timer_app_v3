import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  int appTheme;

  AppSettings({
    required this.appTheme,
  });

  switchAppTheme(int newValue) {
    appTheme = newValue;
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('appTheme', appTheme);
  }

  static Future<AppSettings?> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appTheme')) {
      return AppSettings(
        appTheme: prefs.getInt('appTheme') ?? 0,
      );
    }
    return null;
  }
}
