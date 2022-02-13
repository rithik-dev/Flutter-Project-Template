import 'package:flutter/material.dart';
import 'package:project_template/controllers/locale_controller.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:provider/provider.dart';

class LanguageListTile extends StatelessWidget {
  static const id = 'LanguageListTile';

  const LanguageListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        height: double.infinity,
        child: Icon(Icons.language),
      ),
      title: Text(L10n.dictionary.language),
      subtitle: Text(LocaleController.of(context).currentLanguageName),
      onTap: () => _showChangeLanguageDialog(context),
    );
  }
}

void _showChangeLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const _ChooseLanguageDialog(),
  );
}

class _ChooseLanguageDialog extends StatelessWidget {
  const _ChooseLanguageDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleController>(
      builder: (context, localCon, _) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                L10n.dictionary.chooseLanguage,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ...L10n.supportedLocales.map(
              (locale) => RadioListTile<Locale>(
                title: Text(L10n.getLanguageName(locale.languageCode)!),
                value: locale,
                groupValue: localCon.locale,
                onChanged: (v) => localCon.setLocaleString(v!.languageCode),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(L10n.dictionary.ok),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
