import 'package:flutter/material.dart';
import 'package:project_template/controllers/theme_controller.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/utils/helpers.dart';
import 'package:provider/provider.dart';

class ThemeListTile extends StatelessWidget {
  static const id = 'ThemeListTile';

  const ThemeListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        height: double.infinity,
        child: Icon(Icons.brush),
      ),
      title: Text(L10n.dictionary.theme),
      subtitle: Text(ThemeController.of(context).currentThemeName),
      onTap: () => _showChangeThemeDialog(context),
    );
  }
}

void _showChangeThemeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const _ChooseThemeDialog(),
  );
}

class _ChooseThemeDialog extends StatelessWidget {
  const _ChooseThemeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeCon, _) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                L10n.dictionary.chooseTheme,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ...ThemeMode.values.map(
              (themeMode) => RadioListTile<String>(
                title: Text(capitalize(themeMode.name)),
                value: themeMode.name,
                groupValue: themeCon.themeMode?.name,
                onChanged: (v) => themeCon.setThemeString(v!),
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
