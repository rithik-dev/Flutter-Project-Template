// flutter gen-l10n

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_template/utils/globals.dart';

class L10n {
  const L10n._();

  static const _languagesMap = <String, Map<String?, String>>{
    'en': {null: 'English'},
    'hi': {null: 'हिन्दी'},
  };

  static const fallbackLocale = Locale('en');

  static String? getLanguageName(Locale locale) =>
      _languagesMap[locale.languageCode]?[locale.countryCode] ??
      _languagesMap[locale.languageCode]?[null];

  static Iterable<Locale> get supportedLocales {
    final locales = <Locale>[];
    _languagesMap.forEach((languageCode, countryCodesMap) {
      countryCodesMap.forEach((countryCode, _) {
        locales.add(Locale(languageCode, countryCode));
      });
    });
    return locales;
  }

  static bool isSupported(Locale locale) {
    try {
      supportedLocales.firstWhere(
        (element) => locale.languageCode == element.languageCode,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  static List<LocalizationsDelegate> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static AppLocalizations get dictionary =>
      AppLocalizations.of(Globals.context)!;

  static Locale getAppLocale(BuildContext context) =>
      Localizations.localeOf(context);
}
