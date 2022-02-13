import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const _defaultElevation = 2.5;
  static const _defaultFontFamily = 'ProductSans';

  static const _lightColorScheme = ColorScheme.light();
  static const _darkColorScheme = ColorScheme.dark();

  static ThemeData _baseTheme(
    Brightness brightness, {
    Color? accentColor,
    Color? onAccentColor,
    Color? scaffoldBackgroundColor,
  }) {
    late final ThemeData themeData;
    late final ColorScheme defaultColorScheme;
    switch (brightness) {
      case Brightness.light:
        themeData = ThemeData.light();
        defaultColorScheme = _lightColorScheme;
        break;
      case Brightness.dark:
        themeData = ThemeData.dark();
        defaultColorScheme = _darkColorScheme;
        break;
    }

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: _defaultFontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: themeData.appBarTheme.copyWith(
        elevation: _defaultElevation,
        backgroundColor: scaffoldBackgroundColor,
      ),
      colorScheme: defaultColorScheme.copyWith(
        brightness: brightness,
        // primary: accentColor,
        secondary: accentColor,
        onSecondary: onAccentColor,
      ),
      toggleableActiveColor: accentColor,
      // textSelectionTheme: TextSelectionThemeData(
      //   cursorColor: accentColor,
      //   selectionColor: accentColor?.withOpacity(0.75),
      //   selectionHandleColor: accentColor?.withOpacity(0.75),
      // ),
      dialogTheme: DialogTheme(
        elevation: _defaultElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: _defaultElevation,
        highlightElevation: _defaultElevation * 2,
        // backgroundColor: accentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: _defaultElevation,
        backgroundColor: accentColor,
        contentTextStyle: const TextStyle(fontSize: 16),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      ),
    );
  }

  static final lightTheme = _baseTheme(
    Brightness.light,
    accentColor: const Color(0xFF0669F8),
    onAccentColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFA3AACA),
  ).copyWith(
    cardColor: const Color(0xFFFFFFFF),
  );

  static final darkTheme = _baseTheme(
    Brightness.dark,
    accentColor: const Color(0xFFEB05FF),
    onAccentColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFF344FA1),
  ).copyWith(
    cardColor: const Color(0xFF031956),
  );
}
