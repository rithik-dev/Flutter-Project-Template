import 'package:flutter/cupertino.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/services/local_storage.dart';
import 'package:provider/provider.dart';

class LocaleController extends ChangeNotifier {
  static LocaleController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<LocaleController>(context, listen: listen);

  static const _sharedPrefsKey = 'locale';
  static const _fallbackLocale = Locale('en');

  LocaleController() {
    _initialize();
  }

  Locale? _locale;

  Locale? get locale => _locale;

  String get currentLanguageName =>
      L10n.getLanguageName(_locale!.languageCode)!;

  void _initialize() {
    final currentLocale = LocalStorage.read(_sharedPrefsKey);
    _locale = _getLocaleFromString(currentLocale);
    notifyListeners();
  }

  Locale _getLocaleFromString(String? localeName) {
    if (localeName == null) return _fallbackLocale;
    return Locale(localeName);
  }

  void setLocaleString(String locale) {
    final newLocale = Locale(locale);

    // Only update if present in list of supported locales.
    if (!L10n.supportedLocales.contains(newLocale)) return;

    _locale = newLocale;
    LocalStorage.write(_sharedPrefsKey, newLocale.languageCode);
    notifyListeners();
  }

// void clear() {
//   _locale = null;
//   LocalStorage.remove(_sharedPrefsKey);
//   notifyListeners();
// }
}
