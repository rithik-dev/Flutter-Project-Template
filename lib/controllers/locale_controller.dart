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

  LocaleController() {
    _initialize();
  }

  Locale? _locale;

  Locale? get locale => _locale;

  String get currentLanguageName => L10n.getLanguageName(_locale!)!;

  void _initialize() {
    final sharedPrefsLocale = LocalStorage.read(_sharedPrefsKey);
    if (sharedPrefsLocale != null) {
      _locale = _getLocaleFromString(sharedPrefsLocale);
      notifyListeners();
    }
  }

  Locale _getLocaleFromString(String localeName) {
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
    bool notify = true,
  }) {
    // Only update if present in list of supported locales.
    if (!L10n.isSupported(newLocale)) return;

    if (setOnlyIfNotUpdatedManually) {
      // checking whether 'locale' exists in storage
      final exists = LocalStorage.containsKey(_sharedPrefsKey);
      if (exists) return;
    }

    _locale = newLocale;
    if (updateLocalStorage) {
      LocalStorage.write(_sharedPrefsKey, _locale?.toString());
    }

    if (notify) notifyListeners();
  }

  void clear() {
    _locale = null;
    LocalStorage.remove(_sharedPrefsKey);
    notifyListeners();
  }
}
