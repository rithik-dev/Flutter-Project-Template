import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const _kAccentColor = Color(0xFFFF717F);
  static const kCyanColor = Color(0xFF05F0FF);
  static const kTealColor = Color(0xFF5DC9BC);

  static const _elevation = 1.5;

  static const _defaultFont = 'ProductSans';

  static ThemeData _baseTheme(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      fontFamily: _defaultFont,
    ).copyWith(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _kAccentColor,
        secondary: _kAccentColor,
      ),
      toggleableActiveColor: _kAccentColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _kAccentColor,
        selectionColor: _kAccentColor.withOpacity(0.75),
        selectionHandleColor: _kAccentColor.withOpacity(0.75),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: _kAccentColor,
          shadowColor: _kAccentColor,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: _elevation,
        highlightElevation: _elevation,
        backgroundColor: _kAccentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _kAccentColor,
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      ),
    );
  }

  static final lightTheme = _baseTheme(Brightness.light);
  static final darkTheme = _baseTheme(Brightness.dark);
}
