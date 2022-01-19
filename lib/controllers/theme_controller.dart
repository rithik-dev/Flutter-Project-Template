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

  void _initialize() {
    final currentTheme = LocalStorage.read('theme');
    switch (currentTheme) {
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
      default:
        _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    LocalStorage.write('theme', themeMode.name);
    notifyListeners();
  }

  void clear() {
    _themeMode = null;
    LocalStorage.remove('theme');
    notifyListeners();
  }
}
