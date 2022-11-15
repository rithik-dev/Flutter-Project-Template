import 'package:flutter/material.dart';
import 'package:project_template/screens/home_screen.dart';
import 'package:project_template/screens/splash_screen.dart';
import 'package:project_template/utils/logger.dart';

extension _RouteGenExtension on Widget {
  MaterialPageRoute createRoute() => MaterialPageRoute(builder: (_) => this);
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    log<RouteGenerator>(msg: "Pushed ${settings.name}(${args ?? ''})");
    switch (settings.name) {
      case SplashScreen.id:
        return const SplashScreen().createRoute();
      case HomeScreen.id:
        return const HomeScreen().createRoute();
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return Scaffold(
      body: Center(
        child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
      ),
    ).createRoute();
  }
}
