import 'package:flutter/material.dart';
import 'package:project_template/services/local_storage.dart';
import 'package:provider/provider.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ThemeController>(context, listen: listen);

  ThemeController() {
    _initialize();
  }

  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  ThemeMode _getThemeModeFromString(String themeString) {
    try {
      return ThemeMode.values.byName(themeString);
    } catch (_) {
      return ThemeMode.system;
    }
  }

  void _initialize() {
    final currentTheme = LocalStorage.read('theme');
    _themeMode = _getThemeModeFromString(currentTheme);
    notifyListeners();
  }

  void setTheme(String theme) {
    final newThemeMode = _getThemeModeFromString(theme);
    _setThemeMode(newThemeMode);
  }

  void _setThemeMode(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    LocalStorage.write('theme', newThemeMode.name);
    notifyListeners();
  }

  void clear() {
    _themeMode = null;
    LocalStorage.remove('theme');
    notifyListeners();
  }
}
