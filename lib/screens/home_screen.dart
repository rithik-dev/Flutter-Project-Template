import 'package:flutter/material.dart';
import 'package:project_template/l10n/l10n.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            L10n.dictionary.language,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
