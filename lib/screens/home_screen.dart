import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/widgets/language_list_tile.dart';
import 'package:project_template/widgets/theme_list_tile.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Project Template'),
        ),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text(L10n.dictionary.tapBackButtonAgainToExit),
          ),
          child: ListView(
            children: const [
              ThemeListTile(),
              LanguageListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
