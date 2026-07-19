import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../SharedPreferencess/AppThemePref.dart';

class ThemeProvider extends StateNotifier<AppTheme> {
  ThemeProvider() : super(AppTheme.system) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    state = await ThemePreference.getTheme();
  }

  Future<void> changeTheme(AppTheme theme) async {
    state = theme;
    await ThemePreference.saveTheme(theme);
  }
}

final themeProvider =
StateNotifierProvider<ThemeProvider, AppTheme>((ref) {
  return ThemeProvider();
});