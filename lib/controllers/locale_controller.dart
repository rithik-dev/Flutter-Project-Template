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

  String get currentLanguageName => L10n.getLanguageName(_locale!)!;

  void _initialize() {
    final currentLocale = LocalStorage.read(_sharedPrefsKey);
    _locale = _getLocaleFromString(currentLocale);
    notifyListeners();
  }

  Locale _getLocaleFromString(String? localeName) {
    if (localeName == null) return _fallbackLocale;

    if (localeName.contains('_')) {
      // has a specific country code
      final x = localeName.split('_');
      return Locale(x.first, x.last);
    } else {
      return Locale(localeName);
    }
  }

  void setLocale(
    Locale newLocale, {
    bool setOnlyIfNotUpdatedManually = false,
    bool updateLocalStorage = true,
  }) {
    // Only update if present in list of supported locales.
    final idx = L10n.supportedLocales.toList().indexWhere(
          (locale) => locale.languageCode == newLocale.languageCode,
        );
    final isSupported = idx != -1;
    if (!isSupported) return;

    if (setOnlyIfNotUpdatedManually) {
      // checking whether 'locale' exists in storage
      final exists = LocalStorage.containsKey(_sharedPrefsKey);
      if (exists) return;
    }

    _locale = newLocale;
    if (updateLocalStorage) {
      LocalStorage.write(_sharedPrefsKey, _locale?.toString());
    }

    notifyListeners();
  }

  void clear() {
    // _locale = null;
    LocalStorage.remove(_sharedPrefsKey);
  }
}
