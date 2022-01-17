import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:project_template/screens/splash_screen.dart';
import 'package:project_template/utils/app_theme.dart';
import 'package:project_template/utils/route_generator.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(_MainApp());
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(_, child, ___) => child;
}

class _MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      builder: (_, child) => ScrollConfiguration(
        behavior: _ScrollBehavior(),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: SplashScreen.id,
    );
  }
}
