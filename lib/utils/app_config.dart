import 'package:flutter/material.dart';
import 'package:project_template/common_main.dart';

enum Environment {
  development,
  production,
  test,
}

class AppConfig extends InheritedWidget {
  const AppConfig({
    Key? key,
    required this.env,
  }) : super(key: key, child: const MainApp());

  final Environment env;

  bool get isDev => env == Environment.development;

  bool get isProd => env == Environment.production;

  bool get isTest => env == Environment.test;

  static AppConfig of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppConfig>()!;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
