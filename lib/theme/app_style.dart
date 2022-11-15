part of 'app_theme.dart';

class AppStyle extends ThemeExtension<AppStyle> {
  final Color? textColor;

  const AppStyle._({
    this.textColor,
  });

  factory AppStyle._lightTheme() {
    return const AppStyle._(
      textColor: Colors.black,
    );
  }

  factory AppStyle._darkTheme() {
    return const AppStyle._(
      textColor: Colors.white,
    );
  }

  @override
  ThemeExtension<AppStyle> copyWith({
    Color? textColor,
  }) =>
      AppStyle._(
        textColor: textColor ?? this.textColor,
      );

  @override
  ThemeExtension<AppStyle> lerp(ThemeExtension<AppStyle>? other, double t) {
    if (other is! AppStyle) return this;

    return AppStyle._(
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
