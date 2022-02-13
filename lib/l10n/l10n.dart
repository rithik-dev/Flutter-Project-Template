// flutter gen-l10n

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_template/utils/globals.dart';

class L10n {
  const L10n._();

  static const _languagesMap = <String, String>{
    'en': 'English',
    'hi': 'हिन्दी',
  };

  static String? getLanguageName(String localeName) =>
      _languagesMap[localeName];

  static Iterable<Locale> get supportedLocales =>
      _languagesMap.keys.map((e) => Locale(e));

  static List<LocalizationsDelegate> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static AppLocalizations get dictionary =>
      AppLocalizations.of(Globals.context)!;
}
