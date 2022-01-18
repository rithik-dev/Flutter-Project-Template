import 'package:flutter/cupertino.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:provider/provider.dart';

class LocaleController extends ChangeNotifier {
  static LocaleController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<LocaleController>(context, listen: listen);

  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    // Only update if present in list of supported locales.
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clear() {
    _locale = null;
    notifyListeners();
  }
}
