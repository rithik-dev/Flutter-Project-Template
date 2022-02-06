import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:project_template/controllers/locale_controller.dart';
import 'package:project_template/controllers/theme_controller.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/screens/splash_screen.dart';
import 'package:project_template/services/local_storage.dart';
import 'package:project_template/utils/app_theme.dart';
import 'package:project_template/utils/globals.dart';
import 'package:project_template/utils/route_generator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalStorage.initialize();
  runApp(_MainApp());
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(_, child, __) => child;
}

class _MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeController(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: _ScrollBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        locale: LocaleController.of(context).locale,
        themeMode: ThemeController.of(context).themeMode,
        supportedLocales: L10n.all,
        localizationsDelegates: L10n.localizationsDelegates,
        navigatorKey: Globals.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
