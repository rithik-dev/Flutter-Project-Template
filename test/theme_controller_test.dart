import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_template/controllers/theme_controller.dart';
import 'package:project_template/services/local_storage.dart';

void main() async {
  await LocalStorage.initialize();

  late ThemeController sut;

  setUp(() {
    LocalStorage.clear();

    sut = ThemeController();
  });

  group(ThemeController, () {
    test('checks initial values', () {
      expect(sut.themeMode, ThemeMode.system);
      expect(sut.currentThemeName, 'System');
      expect(LocalStorage.read('theme'), null);
    });

    test('tests if "system" is passed to setThemeString()', () {
      sut.setThemeString('system');
      expect(sut.themeMode, ThemeMode.system);
      expect(sut.currentThemeName, 'System');
      expect(LocalStorage.read('theme'), 'system');
    });

    test('tests if "light" is passed to setThemeString()', () {
      sut.setThemeString('light');
      expect(sut.themeMode, ThemeMode.light);
      expect(sut.currentThemeName, 'Light');
      expect(LocalStorage.read('theme'), 'light');
    });

    test('tests if "dark" is passed to setThemeString()', () {
      sut.setThemeString('dark');
      expect(sut.themeMode, ThemeMode.dark);
      expect(sut.currentThemeName, 'Dark');
      expect(LocalStorage.read('theme'), 'dark');
    });
  });
}
