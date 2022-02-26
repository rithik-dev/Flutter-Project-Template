import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  runApp(const MainApp());
}

class _ScrollBehavior extends ScrollBehavior {
  const _ScrollBehavior({
    AndroidOverscrollIndicator? androidOverscrollIndicator,
  }) : super(androidOverscrollIndicator: androidOverscrollIndicator);

  @override
  Widget buildViewportChrome(_, child, __) => child;
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

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
        builder: _appBuilder,
        scrollBehavior: const _ScrollBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        locale: LocaleController.of(context).locale,
        themeMode: ThemeController.of(context).themeMode,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.localizationsDelegates,
        navigatorKey: Globals.navigatorKey,
        scaffoldMessengerKey: Globals.scaffoldMessengerKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }

  Widget _appBuilder(BuildContext context, Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: child!,
      value: SystemUiOverlayStyle.light,
    );
  }
}
