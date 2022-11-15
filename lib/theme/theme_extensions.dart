import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:project_template/theme/app_theme.dart';

extension MyThemeExtension on ThemeData {
  AppStyle get appStyle => extension<AppStyle>()!;
}
