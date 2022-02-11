import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const _elevation = 2.5;
  static const _defaultFont = 'ProductSans';

  static ThemeData _baseTheme(
    Brightness brightness, {
    Color? accentColor,
    Color? onAccentColor,
    Color? scaffoldBackgroundColor,
  }) {
    late final ColorScheme colorScheme;
    switch (brightness) {
      case Brightness.light:
        colorScheme = const ColorScheme.light();
        break;
      case Brightness.dark:
        colorScheme = const ColorScheme.dark();
        break;
    }

    return ThemeData(
      brightness: brightness,
      fontFamily: _defaultFont,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: _elevation,
        backgroundColor: scaffoldBackgroundColor,
      ),
      colorScheme: colorScheme.copyWith(
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
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: _elevation,
        highlightElevation: _elevation * 2,
        // backgroundColor: accentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: _elevation,
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
