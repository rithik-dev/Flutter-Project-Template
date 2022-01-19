import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  const L10n._();

  static const all = [
    // English
    Locale('en'),

    // Hindi
    Locale('hi'),
  ];

  static List<LocalizationsDelegate> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;
}
