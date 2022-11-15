import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_style.dart';

// @github/rithik-dev
//
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

    /// The other brightness...
    ///
    /// if [brightness] is [Brightness.light],
    /// then [contrastingBrightness] is [Brightness.dark].
    ///
    /// if [brightness] is [Brightness.dark],
    /// then [contrastingBrightness] is [Brightness.light].
    late final Brightness contrastingBrightness;

    switch (brightness) {
      case Brightness.light:
        defaultColorScheme = const ColorScheme.light();
        contrastingBrightness = Brightness.dark;
        textColor ??= Colors.black;
        break;
      case Brightness.dark:
        defaultColorScheme = const ColorScheme.dark();
        contrastingBrightness = Brightness.light;
        textColor ??= Colors.white;
        break;
    }

    final systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarBrightness: brightness,
      statusBarColor: scaffoldBackgroundColor,
      systemNavigationBarColor: scaffoldBackgroundColor,
      systemNavigationBarDividerColor: scaffoldBackgroundColor,
      statusBarIconBrightness: contrastingBrightness,
      systemNavigationBarIconBrightness: contrastingBrightness,
    );

    final iconThemeData = IconThemeData(color: accentColor);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: _defaultFontFamily,
      iconTheme: iconThemeData,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: _defaultElevation,
        systemOverlayStyle: systemUiOverlayStyle,
        color: scaffoldBackgroundColor,
        iconTheme: iconThemeData,
        actionsIconTheme: iconThemeData,
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
        contentTextStyle: TextStyle(
          fontSize: 16,
          fontFamily: _defaultFontFamily,
          color: onAccentColor ?? textColor,
        ),
        behavior: SnackBarBehavior.floating,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
      // cupertinoOverrideTheme: CupertinoThemeData(
      //   brightness: brightness,
      //   scaffoldBackgroundColor: scaffoldBackgroundColor,
      // ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
          TargetPlatform.values,
          value: (_) => const ZoomPageTransitionsBuilder(),
        ),
      ),
    );
  }

  static final lightTheme = _baseTheme(
    Brightness.light,
    accentColor: const Color(0xFF0669F8),
    onAccentColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFDCDFE2),
  ).copyWith(
    cardColor: const Color(0xFFCACFD6),
    extensions: <ThemeExtension>{
      AppStyle._lightTheme(),
    },
  );

  static final darkTheme = _baseTheme(
    Brightness.dark,
    accentColor: Colors.tealAccent,
    onAccentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFF040F2D),
  ).copyWith(
    cardColor: const Color(0xFF091642),
    extensions: <ThemeExtension>{
      AppStyle._darkTheme(),
    },
  );
}
