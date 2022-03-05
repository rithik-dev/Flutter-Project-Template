import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static const _defaultElevation = 2.5;
  static const _defaultFontFamily = 'ProductSans';

  static ThemeData _baseTheme(
    Brightness brightness, {
    Color? textColor,
    Color? accentColor,
    Color? onAccentColor,
    Color? scaffoldBackgroundColor,
  }) {
    late final ColorScheme defaultColorScheme;
    late final SystemUiOverlayStyle systemUiOverlayStyle;
    switch (brightness) {
      case Brightness.light:
        defaultColorScheme = const ColorScheme.light();
        systemUiOverlayStyle = SystemUiOverlayStyle.dark;
        break;
      case Brightness.dark:
        defaultColorScheme = const ColorScheme.dark();
        systemUiOverlayStyle = SystemUiOverlayStyle.light;
        break;
    }

    return ThemeData(
      brightness: brightness,
      fontFamily: _defaultFontFamily,
      iconTheme: IconThemeData(color: textColor),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: _defaultElevation,
        systemOverlayStyle: systemUiOverlayStyle,
        color: scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: textColor),
        actionsIconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
          color: textColor,
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      colorScheme: defaultColorScheme.copyWith(
        brightness: brightness,
        // primary: accentColor,
        secondary: accentColor,
        onSecondary: onAccentColor ?? textColor,
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
        contentTextStyle: const TextStyle(
          fontSize: 18,
          fontFamily: _defaultFontFamily,
        ),
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
    textColor: Colors.black,
    accentColor: const Color(0xFF0669F8),
    scaffoldBackgroundColor: const Color(0xFFDCDFE2),
  ).copyWith(
    cardColor: const Color(0xFFFFFFFF),
  );

  static final darkTheme = _baseTheme(
    Brightness.dark,
    textColor: Colors.white,
    accentColor: const Color(0xFFEB05FF),
    scaffoldBackgroundColor: const Color(0xFF344FA1),
  ).copyWith(
    cardColor: const Color(0xFF031956),
  );
}
