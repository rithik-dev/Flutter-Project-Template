import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String text,
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), duration: duration),
  );
}

bool isNullOrBlank(String? data) => data?.trim().isEmpty ?? true;

void log(dynamic data) => devtools.log(data.toString());

// Size getParagraphSize(
//   String? text, {
//   TextStyle? style,
// }) {
//   final textPainter = TextPainter(
//     text: TextSpan(text: text, style: style),
//     textDirection: TextDirection.ltr,
//   )..layout(minWidth: 0, maxWidth: double.infinity);
//   return textPainter.size;
// }
