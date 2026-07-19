import 'package:shared_preferences/shared_preferences.dart';
enum AppTheme {
  system,
  light,
  dark,
}

class ThemePreference {
  static const String _themeKey = "app_theme";

  // Save Theme
  static Future<void> saveTheme(AppTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme.name);
  }

  // Load Theme
  static Future<AppTheme> getTheme() async {
    final prefs = await SharedPreferences.getInstance();

    String? value = prefs.getString(_themeKey);

    switch (value) {
      case "light":
        return AppTheme.light;

      case "dark":
        return AppTheme.dark;

      default:
        return AppTheme.system;
    }
  }
}