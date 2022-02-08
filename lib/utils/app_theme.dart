import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  // static const _elevation = 1.5;

  static const defaultFont = 'ProductSans';

  static ThemeData _baseTheme(
    Brightness brightness, {
    Color? accentColor,
    Color? cardColor,
  }) {
    return ThemeData(
      brightness: brightness,
      fontFamily: defaultFont,
    ).copyWith(
      cardColor: cardColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        // primary: accentColor,
        secondary: accentColor,
      ),
      toggleableActiveColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: accentColor?.withOpacity(0.75),
        selectionHandleColor: accentColor?.withOpacity(0.75),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: accentColor,
          shadowColor: accentColor,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // elevation: _elevation,
        // highlightElevation: _elevation,
        backgroundColor: accentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: accentColor,
        contentTextStyle: const TextStyle(fontSize: 16),
        // elevation: _elevation,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        behavior: SnackBarBehavior.fixed,
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
  ).copyWith(
    scaffoldBackgroundColor: const Color(0xFFF8FAFE),
    cardColor: const Color(0xFFFFFFFF),
  );
  static final darkTheme = _baseTheme(
    Brightness.dark,
    accentColor: const Color(0xFFEB05FF),
  ).copyWith(
    scaffoldBackgroundColor: const Color(0xFF344FA1),
    cardColor: const Color(0xFF031956),
  );
}
