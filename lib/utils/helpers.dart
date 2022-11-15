import 'package:flutter/material.dart';

T themedValue<T>(
  BuildContext context,
  T lightValue,
  T darkValue,
) {
  switch (Theme.of(context).brightness) {
    case Brightness.light:
      return lightValue;
    case Brightness.dark:
      return darkValue;
  }
}

bool isNullOrBlank(String? data) => data?.trim().isEmpty ?? true;

String capitalizeFirst(String text) {
  if (isNullOrBlank(text)) return '';
  if (text.length == 1) return text.toUpperCase();
  return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
}
